package com.realty.agency.dao.hibernate;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;

import com.realty.agency.dao.IRatesDao;
import com.realty.agency.domain.MeasureTarget;
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
        String query = "from Rates r "
                        + " where  "
                        +   " r.id.created between :startDate and :endDate"
                        +   " and r.id.created = ("
                        +       " select max(r_.id.created)" 
                        +           " from Rates r_ "
                        +           " where r_.id.employeeId = r.id.employeeId" 
                        +               " and r_.id.measureId = r.id.measureId)"
                        // +    " and m.measureTargetId = " + MeasureTarget.EMPLOYEE.getVal()
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
                +     " ) or tr.passed is null) and m.id <> 3 and m.measure_target_id = " + MeasureTarget.EMPLOYEE.getVal()
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

    @SuppressWarnings("unchecked")
    @Override
    public List<Rates> calculateLastMonthDeptRates() {
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
                "select 6 measure_id, dept.id employee_id, COALESCE(sum(entp.price),:defVal) value, :startDate created" +
                " from agency.depts dept" +
                    " left outer join agency.positions pos on dept.id = pos.dept_id " +
                    " left outer join agency.employees emp on emp.position_id = pos.id" +
                    " left outer join agency.activities act on act.employee_id = emp.id" +
                        " and act.order_created between :startDate and :endDate " +
                    " left outer join agency.entities ent on ent.id = act.entity_id " +
                    " left outer join agency.entity_prices entp on entp.id = ent.id" +
                        " and entp.created = (select max(ep.created) from agency.entity_prices ep where ep.id = ent.id) " +
                    " group by dept.id" +
                " union all " +
                " select 7 measure_id, dept.id employee_id, count(act.id) + :defVal value, :startDate created" +
                " from agency.depts dept" +
                    " left outer join agency.positions pos on dept.id = pos.dept_id " +
                    " left outer join agency.employees emp on emp.position_id = pos.id" +
                    " left outer join agency.activities act on act.employee_id = emp.id" +
                        " and act.order_created between :startDate and :endDate " +
                    " group by dept.id" +
                " union all " +
                " select 8 measure_id, dept.id employee_id, count(emp.id) + :defVal value, :startDate created" +
                " from agency.depts dept" +
                    " left outer join agency.positions pos on dept.id = pos.dept_id " +
                    " left outer join agency.employees emp on emp.position_id = pos.id" +
                    " group by dept.id" +
                " union all " +
                " select 9 measure_id, dept.id employee_id, COALESCE(avg(emp.mah_result),:defVal) value, :startDate created " +
                " from agency.depts dept" +
                    " left outer join agency.positions pos on dept.id = pos.dept_id " +
                    " left outer join agency.employees emp on emp.position_id = pos.id" +
                    " group by dept.id";
        float defVal = 0.1f;
        Query sqlQuery = this.getSession().createSQLQuery(query).addEntity(Rates.class);
        sqlQuery.setString("startDate", df.format(startDate));
        sqlQuery.setString("endDate", df.format(endDate));
        sqlQuery.setFloat("defVal", defVal);

        return sqlQuery.list();
    }

    @Override
    public List<Rates> calculateLastMonthCompanyRates() {
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
                " select 10 measure_id, 0 employee_id, COALESCE(avg(dept.mah_result),:defVal) value, :startDate created " +
                " from agency.depts dept" +
                " union all " +
                " select 11 measure_id, 0 employee_id, COUNT(ent.id) + :defVal value, :startDate created " +
                    " from agency.entities ent " +
                    " where ent.created  between :startDate and :endDate " +
                " union all " +
                "select 12 measure_id, 0 employee_id, COALESCE(sum(entp.price),:defVal) value, :startDate created" +
                " from  agency.activities act " +
                    " left outer join agency.entities ent on ent.id = act.entity_id " +
                    " left outer join agency.entity_prices entp on entp.id = ent.id" +
                        " and entp.created = (select max(ep.created) from agency.entity_prices ep where ep.id = ent.id) " +
                    " where act.order_created between :startDate and :endDate ";
        float defVal = 0.1f;
        Query sqlQuery = this.getSession().createSQLQuery(query).addEntity(Rates.class);
        sqlQuery.setString("startDate", df.format(startDate));
        sqlQuery.setString("endDate", df.format(endDate));
        sqlQuery.setFloat("defVal", defVal);
        return sqlQuery.list();
    }
}
