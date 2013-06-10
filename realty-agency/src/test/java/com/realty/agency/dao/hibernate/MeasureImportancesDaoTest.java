package com.realty.agency.dao.hibernate;

import static org.junit.Assert.assertFalse;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IMeasureImportancesDao;
import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.MeasureImportancesId;
import com.realty.agency.domain.MeasureTarget;
import com.realty.agency.domain.Measures;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class MeasureImportancesDaoTest {
    @Autowired
    private IMeasuresDao measuresDao;
    @Autowired
    private IMeasureImportancesDao measureImportancesDao;

    @Test
    public void testMI() {
        Measures m = new Measures();
        List<Measures> measures = this.measuresDao.find(m, MeasureTarget.COMPANY);
        for(int i = 0; i < measures.size(); i++) {
            for(int j = i; j < measures.size(); j++) {
                if(j == i) {
                    this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(i).getId(), measures.get(j).getId()), null, null, 1f));
                    continue;
                }
                this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(i).getId(), measures.get(j).getId()), null, null, 0f));
                this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(j).getId(), measures.get(i).getId()), null, null, 0f));
            }
        }
    }

    @Test
    public void test() {
        List<MeasureImportances> mimp = this.measureImportancesDao.find(new MeasureImportances(), MeasureTarget.DEPT);
        assertFalse(mimp.isEmpty());
    }
}
