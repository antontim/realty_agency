package com.realty.agency.services;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IAuthoritiesDao;
import com.realty.agency.dao.IUsersDao;
import com.realty.agency.domain.Authorities;
import com.realty.agency.domain.AuthoritiesId;
import com.realty.agency.domain.Users;

public class UserService implements IUserService {
    private static final String DEFAULT_PASSWORD = "pass";
    private static final String DEFAULT_ROLE = "EMPLOYEE";

    @Autowired
    private IUsersDao usersDao;
    @Autowired
    private IAuthoritiesDao authoritiesDao;

    @Override
    public void createUser(String username) {
        Users us = new Users(username, DEFAULT_PASSWORD);
        this.usersDao.add(us);

        this.authoritiesDao.add(new Authorities(new AuthoritiesId(username,
                DEFAULT_ROLE)));
    }

    @Override
    public void deleteUser(String username) {
        this.usersDao.delete(new Users(username, null));
    }
}
