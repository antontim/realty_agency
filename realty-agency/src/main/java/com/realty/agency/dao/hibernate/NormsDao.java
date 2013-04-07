package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.INormsDao;
import com.realty.agency.domain.Norms;

/**
 * Home object for domain model class Norms.
 * 
 * @see com.realty.agency.domain.Norms
 */
public class NormsDao extends HibernateDao<Norms> implements INormsDao {

    public NormsDao() {
        super.setEntityName("com.realty.agency.domain.Norms");
    }
}
