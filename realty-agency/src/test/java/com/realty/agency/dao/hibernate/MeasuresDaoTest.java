package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.domain.Measures;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class MeasuresDaoTest {

    @Autowired
    private IMeasuresDao measuresDao;
    
    @Test
    public void testLoadMeasures() {
        List<Measures> res = this.measuresDao.findMeasureRatesForEmp(101);
        
        assertEquals(5,res.size());
    }
}
