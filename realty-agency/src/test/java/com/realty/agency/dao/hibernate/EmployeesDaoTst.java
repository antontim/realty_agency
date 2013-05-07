package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Employees;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EmployeesDaoTst {
    @Autowired
    private IEmployeesDao employeesDao;
    
    @Test
    public void test() {
        List<Employees> res = this.employeesDao.findLastMonthTestResults();
        
        assertEquals(5,res.size());
    }
}
