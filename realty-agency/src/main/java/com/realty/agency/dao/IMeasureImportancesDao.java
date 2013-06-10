package com.realty.agency.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.MeasureTarget;

@Transactional
public interface IMeasureImportancesDao extends IDao<MeasureImportances> {
    List<MeasureImportances> find(MeasureImportances criteria, MeasureTarget mt);
}
