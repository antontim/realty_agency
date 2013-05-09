package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Employees;

/**
 * Home object for domain model class Employees.
 * 
 * @see com.realty.agency.domain.Employees
 */
public class EmployeesDao extends HibernateDao<Employees> implements
        IEmployeesDao {

    public EmployeesDao() {
        super.setEntityName("com.realty.agency.domain.Employees");
    }
}
