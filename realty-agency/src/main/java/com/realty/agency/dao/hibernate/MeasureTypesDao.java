package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IMeasureTypesDao;
import com.realty.agency.domain.MeasureTypes;

/**
 * Home object for domain model class MeasureTypes.
 * 
 * @see com.realty.agency.domain.MeasureTypes
 */
public class MeasureTypesDao extends HibernateDao<MeasureTypes> implements
        IMeasureTypesDao {

    public MeasureTypesDao() {
        super.setEntityName("com.realty.agency.domain.MeasureTypes");
    }
}
