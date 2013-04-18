package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Employees;

public class EmployeeService implements IEmployeeService {

    @Autowired
    private IEmployeesDao employeesDao;
    
    @Override
    public List<Employees> loadEmployees(Employees criteria) {
        return this.employeesDao.find(criteria);
    }

}
