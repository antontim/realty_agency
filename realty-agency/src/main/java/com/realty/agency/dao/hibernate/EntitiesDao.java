package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.domain.Entities;

/**
 * Home object for domain model class Entities.
 * 
 * @see com.realty.agency.domain.Entities
 */
public class EntitiesDao extends HibernateDao<Entities> implements IEntitiesDao {

    public EntitiesDao() {
        super.setEntityName("com.realty.agency.domain.Entities");
    }
}
