package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Depts;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Positions;

public class EmployeeService implements IEmployeeService {

    @Autowired
    private IEmployeesDao employeesDao;
    
    @Override
    public List<Employees> loadEmployees(Employees criteria) {
        return this.employeesDao.find(criteria);
    }

    @Override
    public Employees addEmployee(String name, int posId, int deptId) {
        Employees emp = new Employees();
        Positions pos = new Positions();
        pos.setId(posId);
        Depts dept = new Depts();
        dept.setId(deptId);
        pos.setDepts(dept);
        emp.setName(name);
        emp.setPositions(pos);
        this.employeesDao.add(emp);
        
        return emp;
    }
}
