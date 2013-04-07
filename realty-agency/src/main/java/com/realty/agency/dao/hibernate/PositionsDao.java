package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IPositionsDao;
import com.realty.agency.domain.Positions;

/**
 * Home object for domain model class Positions.
 * 
 * @see com.realty.agency.domain.Positions
 */
public class PositionsDao extends HibernateDao<Positions> implements
        IPositionsDao {

    public PositionsDao() {
        super.setEntityName("com.realty.agency.domain.Positions");
    }
}
