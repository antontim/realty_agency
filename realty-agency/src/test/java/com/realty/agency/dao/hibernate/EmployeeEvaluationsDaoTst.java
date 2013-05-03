package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertEquals;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IEmployeeEvaluationsDao;
import com.realty.agency.domain.EmployeeEvaluations;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EmployeeEvaluationsDaoTst {
    @Autowired
    private IEmployeeEvaluationsDao employeeEvaluationsDao;
    
    @Test
    public void testFindByRange() {
        Calendar cal = Calendar.getInstance();
        Date endDate = cal.getTime();
        cal.add(Calendar.MONTH, -1);
        Date startDate = cal.getTime();

        List<EmployeeEvaluations> res = this.employeeEvaluationsDao.findByRange(101,
                startDate, endDate);
        
        assertEquals(3, res.size());
    }
}
