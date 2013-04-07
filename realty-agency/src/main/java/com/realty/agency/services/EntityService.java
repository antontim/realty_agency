package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.domain.Entities;

public class EntityService implements IEntityService {
    @Autowired
    private IEntitiesDao entitiesDao;

    @Override
    public List<Entities> loadEntities(Entities criteria) {
        return this.entitiesDao.find(criteria);
    }

    @Override
    public Entities createEntity(Entities entity) {
        this.entitiesDao.add(entity);
        List<Entities> added = this.entitiesDao.find(entity);
        return CollectionUtils.isEmpty(added) ? null : added.get(0);
    }

    @Override
    public Entities updateEntity(Entities entity) {
        return this.entitiesDao.update(entity);
    }

    @Override
    public void deleteEntity(int id) {
        Entities entity = new Entities();
        entity.setId(id);
        this.entitiesDao.delete(entity);
    }
}
