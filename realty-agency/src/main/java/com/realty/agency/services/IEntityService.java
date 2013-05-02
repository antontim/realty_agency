package com.realty.agency.services;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.realty.agency.domain.Entities;
import com.realty.agency.domain.EntityClass;
import com.realty.agency.domain.EntityTypes;

public interface IEntityService {
    List<Entities> loadEntities(Entities criteria);

    Entities createEntity(String addr, int classId, int typeId, String price);

    Entities updateEntity(Entities entity);

    void deleteEntity(int id);

    List<EntityTypes> loadAllTypes();

    List<EntityClass> loadAllClasses();
}
