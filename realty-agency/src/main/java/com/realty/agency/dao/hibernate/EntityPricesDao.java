package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEntityPricesDao;
import com.realty.agency.domain.EntityPrices;

/**
 * Home object for domain model class EntityPrices.
 * @see com.realty.agency.domain.EntityPrices
 */
public class EntityPricesDao extends HibernateDao<EntityPrices> implements IEntityPricesDao {

    public EntityPricesDao() {
        super.setEntityName("com.realty.agency.domain.EntityPrices");
    }
}
