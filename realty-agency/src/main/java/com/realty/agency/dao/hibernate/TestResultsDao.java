package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.ITestResultsDao;
import com.realty.agency.domain.TestResults;

/**
 * Home object for domain model class TestResults.
 * 
 * @see com.realty.agency.domain.TestResults
 */
public class TestResultsDao extends HibernateDao<TestResults> implements
        ITestResultsDao {

    public TestResultsDao() {
        super.setEntityName("com.realty.agency.domain.TestResults");
    }
}
