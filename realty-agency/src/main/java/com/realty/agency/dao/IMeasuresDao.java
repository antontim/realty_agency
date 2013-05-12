package com.realty.agency.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.Measures;

@Transactional
public interface IMeasuresDao extends IDao<Measures> {
    List<Measures> findMeasureRatesForEmp(int empId);

    List<Measures> find(Measures criteria, boolean isEarningsReq);
}
