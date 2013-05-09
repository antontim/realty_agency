package com.realty.agency.dao.hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.realty.agency.dao.IRatesDao;
import com.realty.agency.domain.Rates;

/**
 * Home object for domain model class Rates.
 * 
 * @see com.realty.agency.domain.Rates
 */
public class RatesDao extends HibernateDao<Rates> implements IRatesDao {

    private final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    public RatesDao() {
        super.setEntityName("com.realty.agency.domain.Rates");
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Rates> findLastMonthEmpMeasureRates(Date startDate, Date endDate) {
        String query = "from Rates r"
                        + " where r.id.created between :startDate and :endDate"
                        +   " and r.id.created = ("
                        +       " select max(r_.id.created)" 
                        +           " from Rates r_ "
                        +           " where r_.id.employeeId = r.id.employeeId" 
                        +               " and r_.id.measureId = r.id.measureId)"
                        +" order by r.id.measureId, r.id.employeeId";
        Query hqlQuery = this.getSession().createQuery(query);
        hqlQuery.setString("startDate", df.format(startDate));
        hqlQuery.setString("endDate", df.format(endDate));

        return hqlQuery.list();
    }

    @Override
    public List<Rates> calculateLastMonthEmpRates() {
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
                + " select m.id, emp.id, SYSDATE(), avg(COALESCE(tr.result,:defVal)) +"
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
                + " where ((tr.passed between :startDate and :endDate"
                +     " and tr.passed = ("
                +         " select max(tr1.passed)" 
                +             " from agency.test_results tr1" 
                +             " where tr1.employee_id = emp.id" 
                +                 " and tr1.test_id = t.id)"
                +     " ) or tr.passed is null) and m.id <> 3"
                + " group by m.id,emp.id" +
                " union all "
                + " select 3, earnings.eId, SYSDATE(), avg(earnings.res) from"
                + " (select emp.id eId, "
                + " COALESCE(sum(p.price)/(select n.month_norm/100"
                +                 " from agency.norms n"
                +               " where n.activity_type_id = a.activity_type_id)/10,:defVal) res"
                + " from agency.employees emp"
                + " left outer join agency.activities a" 
                +            " on a.employee_id = emp.id" 
                +            " and a.order_created between :startDate and :endDate"
                + " left outer join agency.entities e on a.entity_id = e.id"
                + " left outer join agency.entity_prices p "
                +            " on e.id = p.id "
                +            " and p.created = (select max(ep.created) from agency.entity_prices ep"
                +                            " where ep.id = e.id)"
                +" group by emp.id, a.activity_type_id) earnings"
                +" group by earnings.eId;";
        try {
            float defVal = 0.1f;
            Query sqlQuery = this.getSession().createSQLQuery(query);
            sqlQuery.setString("startDate", df.format(startDate));
            sqlQuery.setString("endDate", df.format(endDate));
            sqlQuery.setFloat("defVal", defVal);
            sqlQuery.executeUpdate();

            return this.findLastMonthEmpMeasureRates(startDate, endDate);
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
