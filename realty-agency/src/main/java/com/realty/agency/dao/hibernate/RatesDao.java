package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IRatesDao;
import com.realty.agency.domain.Rates;

/**
 * Home object for domain model class Rates.
 * 
 * @see com.realty.agency.domain.Rates
 */
public class RatesDao extends HibernateDao<Rates> implements IRatesDao {

    public RatesDao() {
        super.setEntityName("com.realty.agency.domain.Rates");
    }
}
