package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.ActivityTypes;
import com.realty.agency.domain.Entities;
import com.realty.agency.domain.EntityClass;
import com.realty.agency.domain.EntityTypes;

public interface IEntityService {
    List<Entities> loadEntities(Entities criteria);

    Entities createEntity(String addrCity, String addrStreet, String addrHouse,
            String addrAppartment, int classId, int typeId, String price);

    Entities updateEntity(int id, String addrCity, String addrStreet,
            String addrHouse, String addrAppartment, int classId, int typeId,
            String price);

    void deleteEntity(int id);

    List<EntityTypes> loadAllTypes();

    List<EntityClass> loadAllClasses();

    List<ActivityTypes> loadAllActTypes();

    void disableEntity(int entId);

    Entities activateEntity(int id);
}
