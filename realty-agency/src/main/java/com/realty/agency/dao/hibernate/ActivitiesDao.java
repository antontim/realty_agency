package com.realty.agency.dao.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.realty.agency.dao.IActivitiesDao;
import com.realty.agency.domain.Activities;

/**
 * ActivitiesDao object for domain model class Activities.
 * 
 * @see com.realty.agency.domain.Activities
 */
public class ActivitiesDao extends HibernateDao<Activities> implements
        IActivitiesDao {

    public ActivitiesDao() {
        super.setEntityName("com.realty.agency.domain.Activities");
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Activities> findByEmpAndDateRange(Integer empId,
            Date startDate, Date endDate) {
        List<Activities> res = new ArrayList<Activities>();
        Criteria crit = this.getSession().createCriteria(
                Activities.class);
        if(empId != null)
            crit.add(Restrictions.eq("employees.id", empId));
        crit.add(Restrictions.between("orderCreated", startDate, endDate));
        res = crit.list();
        return res;
    }
}
