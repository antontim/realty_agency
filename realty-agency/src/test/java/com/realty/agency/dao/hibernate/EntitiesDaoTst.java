package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.domain.Entities;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EntitiesDaoTst {

    @Autowired
    private IEntitiesDao entitiesDao;
    
    @Test
    public void testFind() {
        Entities criteria = new Entities();
        criteria.setAddress("Kharkiv");
        List<Entities> res = this.entitiesDao.find(criteria);
        
        assertTrue(res.size() >= 1);
    }
}
