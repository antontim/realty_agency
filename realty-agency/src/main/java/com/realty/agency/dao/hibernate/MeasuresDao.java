package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.domain.Measures;

/**
 * Home object for domain model class Measures.
 * 
 * @see com.realty.agency.domain.Measures
 */
public class MeasuresDao extends HibernateDao<Measures> implements IMeasuresDao {

    public MeasuresDao() {
        super.setEntityName("com.realty.agency.domain.Measures");
    }
}
