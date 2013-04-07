package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEntityClassDao;
import com.realty.agency.domain.EntityClass;

/**
 * Home object for domain model class EntityClass.
 * @see com.realty.agency.domain.EntityClass
 */
public class EntityClassDao extends HibernateDao<EntityClass> implements IEntityClassDao {

    public EntityClassDao() {
        super.setEntityName("com.realty.agency.domain.EntityClass");
    }
}
