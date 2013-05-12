package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertFalse;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IActivitiesDao;
import com.realty.agency.domain.Activities;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class ActivitiesDaoTst {

    @Autowired
    private IActivitiesDao activitiesDao;
    
    @Test
    public void testInsertActivity() {
        List<Activities> res = this.activitiesDao.findByEmpAndDateRange(123, new Date(), new Date());
        
        assertFalse(res.isEmpty());
    }
}
