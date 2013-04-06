package com.realty.agency.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.EntityTypes;

@Transactional
public interface IEntityTypesDao {
    List<EntityTypes> findByExample(EntityTypes instance);
}
