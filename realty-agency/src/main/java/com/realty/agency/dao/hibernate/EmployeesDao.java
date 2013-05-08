package com.realty.agency.dao.hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.hibernate.Query;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Employees;

/**
 * Home object for domain model class Employees.
 * 
 * @see com.realty.agency.domain.Employees
 */
public class EmployeesDao extends HibernateDao<Employees> implements
        IEmployeesDao {
    private final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    public EmployeesDao() {
        super.setEntityName("com.realty.agency.domain.Employees");
    }

    @Override
    public void calculateMonthEmpRates() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        cal.set(Calendar.MILLISECOND, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.HOUR, 0);
        Date startDate = cal.getTime();
        cal.add(Calendar.DAY_OF_MONTH, 33);
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date endDate = cal.getTime();
        String query = 
"INSERT INTO agency.rates (measure_id,employee_id,created,value)"
+ " select m.id, emp.id, SYSDATE(), avg(COALESCE(tr.result,0)) +"
+     " COALESCE((select avg(ev_.mark) from agency.employee_evaluations ev_"
+         " inner join agency.questions q_ on q_.id = ev_.question_id"
+         " inner join agency.measures m_ on m_.id = q_.measure_id"
+         " inner join agency.employees emp_ on emp_.id = ev_.employee_id"
+         " where ev_.created between :startDate and :endDate"
+             " and emp_.id = emp.id and m_.id = m.id"
+         " group by m_.id),0)/10 as value"
+ " from agency.employees emp"
+ " left outer join agency.measures m on m.id <> -1"
+ " left outer join agency.tests t on m.id = t.measure_id"
+ " left outer join agency.test_results tr on emp.id = tr.employee_id and t.id = tr.test_id"
+ " where (tr.passed between :startDate and :endDate"
+     " and tr.passed = ("
+         " select max(tr1.passed)" 
+             " from agency.test_results tr1" 
+             " where tr1.employee_id = emp.id" 
+                 " and tr1.test_id = t.id)"
+     " ) or tr.passed is null"
+ " group by m.id,emp.id"
+ " order by emp.id, m.id";
        try {
            Query sqlQuery = this.getSession().createSQLQuery(query);
            sqlQuery.setString("startDate", df.format(startDate));
            sqlQuery.setString("endDate", df.format(endDate));
            sqlQuery.executeUpdate();
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
