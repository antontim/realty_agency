package com.realty.agency.dao.hibernate;

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
        List<Measures> measures = this.measuresDao.find(new Measures());
        int counter = 0;
        for(int i = 0; i < measures.size(); i++) {
            for(int j = counter; j < measures.size(); j++) {
                if(j == counter) {
                    this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(i).getId(), measures.get(j).getId()), null, null, 1f));
                    continue;
                }
                this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(i).getId(), measures.get(j).getId()), null, null, 0f));
                this.measureImportancesDao.add(new MeasureImportances(new MeasureImportancesId(measures.get(j).getId(), measures.get(i).getId()), null, null, 0f));
            }
            counter++;
        }
    }
}
