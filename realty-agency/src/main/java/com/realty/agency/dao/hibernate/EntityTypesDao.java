package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEntityTypesDao;
import com.realty.agency.domain.EntityTypes;

/**
 * Home object for domain model class EntityTypes.
 * 
 * @see com.realty.agency.domain.EntityTypes
 */
public class EntityTypesDao extends HibernateDao<EntityTypes> implements
        IEntityTypesDao {

    public EntityTypesDao() {
        super.setEntityName("com.realty.agency.domain.EntityTypes");
    }
}
