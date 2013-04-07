package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.ITestsDao;
import com.realty.agency.domain.Tests;

/**
 * Home object for domain model class Tests.
 * 
 * @see com.realty.agency.domain.Tests
 */
public class TestsDao extends HibernateDao<Tests> implements ITestsDao {

    public TestsDao() {
        super.setEntityName("com.realty.agency.domain.Tests");
    }
}
