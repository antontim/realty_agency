package com.realty.agency.dao;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.Activities;

@Transactional
public interface IActivitiesDao extends IDao<Activities> {
    List<Activities> findByEmpAndDateRange(Integer empId, Date startDate,
            Date endDate);
}
