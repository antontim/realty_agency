package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IEmployeeEvaluationsDao;
import com.realty.agency.domain.EmployeeEvaluations;

/**
 * Home object for domain model class EmployeeEvaluations.
 * 
 * @see com.realty.agency.domain.EmployeeEvaluations
 */
public class EmployeeEvaluationsDao extends HibernateDao<EmployeeEvaluations>
        implements IEmployeeEvaluationsDao {

    public EmployeeEvaluationsDao() {
        super.setEntityName("com.realty.agency.domain.EmployeeEvaluations");
    }
}
