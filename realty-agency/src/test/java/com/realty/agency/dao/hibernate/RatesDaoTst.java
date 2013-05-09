package com.realty.agency.dao.hibernate;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IRatesDao;
import com.realty.agency.domain.Rates;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class RatesDaoTst {
    private Logger logger = LoggerFactory.getLogger(EmployeesDaoTst.class);
    @Autowired
    private IRatesDao ratesDao;
    
    @Test
    public void test() {
        @SuppressWarnings("unused")
        List<Rates> res = this.ratesDao.calculateLastMonthEmpRates();
        
        logger.info("test");
    }
}
