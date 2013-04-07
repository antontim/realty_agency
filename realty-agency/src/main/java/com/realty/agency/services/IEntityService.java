package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Entities;

public interface IEntityService {
    List<Entities> loadEntities(Entities criteria);

    Entities createEntity(Entities entity);

    Entities updateEntity(Entities entity);

    void deleteEntity(int id);
}
