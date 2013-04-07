package com.realty.agency.dao.hibernate;

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
}
