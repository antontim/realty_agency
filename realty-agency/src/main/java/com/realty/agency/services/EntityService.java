package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.dao.IEntityClassDao;
import com.realty.agency.dao.IEntityPricesDao;
import com.realty.agency.dao.IEntityTypesDao;
import com.realty.agency.domain.Entities;
import com.realty.agency.domain.EntityClass;
import com.realty.agency.domain.EntityPrices;
import com.realty.agency.domain.EntityTypes;

public class EntityService implements IEntityService {
    @Autowired
    private IEntitiesDao entitiesDao;
    @Autowired
    private IEntityTypesDao entitiesTypesDao;
    @Autowired
    private IEntityClassDao entitiesClassDao;
    @Autowired
    private IEntityPricesDao entitiesPricesDao;

    @Override
    public List<EntityTypes> loadAllTypes() {
        return this.entitiesTypesDao.find(new EntityTypes());
    }

    @Override
    public List<EntityClass> loadAllClasses() {
        return this.entitiesClassDao.find(new EntityClass());
    }

    @Override
    public List<Entities> loadEntities(Entities criteria) {
        return this.entitiesDao.find(criteria);
    }

    @Override
    public Entities createEntity(String addr, int classId, int typeId, String price) {
        Entities ent = new Entities();
        ent.setAddress(addr);
        ent.setEntityClass(new EntityClass(classId));
        ent.setEntityTypes(new EntityTypes(typeId));
        ent.setActive((byte) 1);
        this.entitiesDao.add(ent);
        this.entitiesPricesDao.add(new EntityPrices(ent.getId(),Float.valueOf(price)));
        List<Entities> added = this.entitiesDao.find(new Entities(ent.getId()));
        return CollectionUtils.isEmpty(added) ? null : added.get(0);
    }

    @Override
    public Entities updateEntity(Entities entity) {
        return this.entitiesDao.update(entity);
    }

    @Override
    public void deleteEntity(int id) {
        this.entitiesDao.delete(new Entities(id));
    }
}
