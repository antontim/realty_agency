package com.realty.agency.dao.hibernate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IEmployeesDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EmployeesDaoTst {
    private Logger logger = LoggerFactory.getLogger(EmployeesDaoTst.class);
    @Autowired
    private IEmployeesDao employeesDao;
    
    @Test
    public void test() {
        this.employeesDao.calculateMonthEmpRates();
        
        logger.info("test");
    }
}
