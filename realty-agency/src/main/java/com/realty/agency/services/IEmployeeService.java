package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Positions;

public interface IEmployeeService {
    Employees loadEmployeeByName(String name);
    
    Employees loadEmployeeById(int id);

    List<Employees> loadEmployees(Employees criteria);

    Employees addEmployee(String name, int posId);

    void deleteEmployee(int id);

    void updateEmployee(int id, String name, int pos);
    
    List<Positions> loadAllPositions();
}
