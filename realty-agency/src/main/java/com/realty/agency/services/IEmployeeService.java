package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Employees;

public interface IEmployeeService {
    List<Employees> loadEmployees(Employees criteria);
}
