package com.realty.agency.services;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EmployeeServiceTst {

    @Autowired
    private IEmployeeService employeeService;
    
    @Test
    public void test() {
        this.employeeService.updateEmployeeMah();
        
        assertTrue(true);
    }
}
