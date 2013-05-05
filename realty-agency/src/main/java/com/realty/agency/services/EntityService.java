package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IActivityTypesDao;
import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.dao.IEntityClassDao;
import com.realty.agency.dao.IEntityPricesDao;
import com.realty.agency.dao.IEntityTypesDao;
import com.realty.agency.domain.ActivityTypes;
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
    @Autowired
    private IActivityTypesDao activityTypesDao;

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
    public Entities updateEntity(int id, String addr, int classId, int typeId, String price) {
        Float priceVal = Float.valueOf(price);
        List<Entities> ents = this.entitiesDao.find(new Entities(id));
        if(ents.size() == 1) {
            Entities ent = ents.get(0);
            if(!ent.getEntityPriceses().get(0).getPrice().equals(priceVal)) {
                EntityPrices priceObj = new EntityPrices(id, priceVal);
                this.entitiesPricesDao.add(priceObj);
            }
            ent.setAddress(addr);
            ent.setEntityClass(new EntityClass(classId));
            ent.setEntityTypes(new EntityTypes(typeId));
            this.entitiesDao.update(ent);
        }
        ents = this.entitiesDao.find(new Entities(id));
        return CollectionUtils.isEmpty(ents) ? null : ents.get(0);
    }

    @Override
    public void deleteEntity(int id) {
        this.entitiesDao.delete(new Entities(id));
    }

    @Override
    public List<ActivityTypes> loadAllActTypes() {
        return this.activityTypesDao.find(new ActivityTypes());
    }

    @Override
    public void disableEntity(int entId) {
        List<Entities> ents = this.entitiesDao.find(new Entities(entId));
        if(ents.size() != 1)
            throw new IncorrectResultSizeDataAccessException(1, ents.size());

        ents.get(0).setActive((byte)0);
        this.entitiesDao.update(ents.get(0));
    }
}
