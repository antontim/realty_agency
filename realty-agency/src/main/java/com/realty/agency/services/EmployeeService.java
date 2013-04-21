package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.dao.IPositionsDao;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Positions;

public class EmployeeService implements IEmployeeService {

    @Autowired
    private IEmployeesDao employeesDao;
    @Autowired
    private IPositionsDao posDao;
    
    @Override
    public Employees loadEmployeeByName(String name) {
        Employees criteria = new Employees();
        criteria.setName(name);
        List<Employees> empls = this.employeesDao.find(criteria);
        return empls.isEmpty() ? null : empls.get(0);
    }

    @Override
    public Employees loadEmployeeById(int id) {
        Employees criteria = new Employees();
        criteria.setId(id);
        List<Employees> empls = this.employeesDao.find(criteria);
        return empls.isEmpty() ? null : empls.get(0);
    }
    
    @Override
    public List<Employees> loadEmployees(Employees criteria) {
        return this.employeesDao.find(criteria);
    }

    @Override
    public Employees addEmployee(String name, int posId) {
        Employees emp = new Employees();
        Positions pos = new Positions();
        pos.setId(posId);
        emp.setName(name);
        emp.setPositions(pos);
        this.employeesDao.add(emp);
        
        return emp;
    }
    
    @Override
    public void deleteEmployee(int id) {
        Employees criteria = new Employees();
        criteria.setId(id);
        this.employeesDao.delete(criteria);
    }
    
    @Override
    public void updateEmployee(int id, String name, int pos) {
        Employees rec = new Employees();
        rec.setId(id);
        rec.setName(name);
        
        Positions position = new Positions();
        position.setId(pos);
        rec.setPositions(position);
        
        this.employeesDao.update(rec);
    }
    
    @Override
    public List<Positions> loadAllPositions() {
        return this.posDao.find(new Positions());
    }
}
