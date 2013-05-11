package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.ITestResultsDao;
import com.realty.agency.domain.TestResults;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class TestResultsDaoTst {
    @Autowired
    private ITestResultsDao testResultsDao;

    @Test
    public void test() {
        TestResults tr = this.testResultsDao.findLatestTest(123, 4);
        
        assertNotNull(tr);
    }
}