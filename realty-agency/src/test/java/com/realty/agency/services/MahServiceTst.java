package com.realty.agency.services;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class MahServiceTst {

    @Autowired
    private IMahService mahService;

    @Test
    public void test() {
        Map<Integer, Float> res = this.mahService.calcAvgMeasuresImp();
        
        assertEquals(5,res.size());
    }
}
