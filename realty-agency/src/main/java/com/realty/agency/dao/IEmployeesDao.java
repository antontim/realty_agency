package com.realty.agency.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.Employees;

@Transactional
public interface IEmployeesDao extends IDao<Employees> {
    List<Employees> findLastMonthTestResults();
}
