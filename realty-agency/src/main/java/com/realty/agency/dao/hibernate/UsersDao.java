package com.realty.agency.dao.hibernate;

// Generated May 5, 2013 5:39:19 PM by Hibernate Tools 3.4.0.CR1

import com.realty.agency.dao.IUsersDao;
import com.realty.agency.domain.Users;

/**
 * Home object for domain model class Users.
 * @see com.realty.agency.domain.Users
 * @author Hibernate Tools
 */
public class UsersDao extends HibernateDao<Users> implements IUsersDao {
    public UsersDao() {
        super.setEntityName("com.realty.agency.domain.Users");
    }
}
