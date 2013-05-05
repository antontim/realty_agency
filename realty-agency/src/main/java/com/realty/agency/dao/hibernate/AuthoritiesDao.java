package com.realty.agency.dao.hibernate;

// Generated May 5, 2013 5:39:19 PM by Hibernate Tools 3.4.0.CR1

import com.realty.agency.dao.IAuthoritiesDao;
import com.realty.agency.domain.Authorities;

/**
 * Home object for domain model class Authorities.
 * @see com.realty.agency.domain.Authorities
 * @author Hibernate Tools
 */
public class AuthoritiesDao extends HibernateDao<Authorities> implements IAuthoritiesDao {

    public AuthoritiesDao() {
        super.setEntityName("com.realty.agency.domain.Authorities");
    }
}
