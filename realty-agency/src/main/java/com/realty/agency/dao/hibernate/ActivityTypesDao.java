package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IActivityTypesDao;
import com.realty.agency.domain.ActivityTypes;

/**
 * Home object for domain model class ActivityTypes.
 * 
 * @see com.realty.agency.domain.ActivityTypes
 */
public class ActivityTypesDao extends HibernateDao<ActivityTypes> implements
        IActivityTypesDao {

    public ActivityTypesDao() {
        super.setEntityName("com.realty.agency.domain.ActivityTypes");
    }
}
