package com.realty.agency.dao.hibernate;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.TestResults;

/**
 * Home object for domain model class Employees.
 * 
 * @see com.realty.agency.domain.Employees
 */
public class EmployeesDao extends HibernateDao<Employees> implements
        IEmployeesDao {

    public EmployeesDao() {
        super.setEntityName("com.realty.agency.domain.Employees");
    }

    @Override
    public List<Employees> findLastMonthTestResults() {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date startDate = cal.getTime();
        cal.add(Calendar.DAY_OF_MONTH, 40);
        cal.set(Calendar.DAY_OF_MONTH, 0);
        Date endDate = cal.getTime();
        List<Employees> res = new ArrayList<Employees>();
        String query = "select emp.name, m.name, tr.result from Employees emp, Measures m"
+ "left outer join emp.testResultses tr"
+ "left outer join tr.tests t with t.measures.id = m.id"
+ "order by emp.id, m.id";
        try {
            Criteria crit = this.getSession().createCriteria(Employees.class,"emp");
            crit.createCriteria("Measures", "m");
            crit.createAlias("testResultses", "tr",Criteria.LEFT_JOIN);
            crit.createAlias("tests", "t",Criteria.LEFT_JOIN
                                ,Restrictions.eqProperty("t.measures.id", "m.id"));
            crit.addOrder(Order.asc("emp.id").asc("m.id"));
            // crit.add(Restrictions.between("id.passed", startDate, endDate));
            res = crit.list();
        } catch (RuntimeException re) {
            throw re;
        }
        return res;
    }
}
