package com.realty.agency.dao.hibernate;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.realty.agency.dao.IEntityTypesDao;
import com.realty.agency.domain.EntityTypes;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class EntityTypeDaoTst {

    @Autowired
    private IEntityTypesDao entityTypesDao;

    @Test
    public void testCreationOfRecord() {
        EntityTypes et = new EntityTypes();
        et.setName("test");
        entityTypesDao.add(et);

        List<EntityTypes> afterData = this.entityTypesDao.find(et);
        assertNotNull(afterData);
        assertEquals(1, afterData.size());
    }
}
