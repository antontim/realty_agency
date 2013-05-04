package com.realty.agency.dao;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.EmployeeEvaluations;

@Transactional
public interface IEmployeeEvaluationsDao extends IDao<EmployeeEvaluations> {
    List<EmployeeEvaluations> findByRange(int id, Date startDate, Date endDate);
}
