package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IDeptsDao;
import com.realty.agency.domain.Depts;

/**
 * Home object for domain model class Depts.
 * 
 * @see com.realty.agency.domain.Depts
 */
public class DeptsDao extends HibernateDao<Depts> implements IDeptsDao {

    public DeptsDao() {
        super.setEntityName("com.realty.agency.domain.Depts");
    }
}
