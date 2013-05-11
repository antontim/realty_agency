package com.realty.agency.dao;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.TestResults;

@Transactional
public interface ITestResultsDao extends IDao<TestResults> {

    List<TestResults> findByEmpAndDateRange(int empId, Date startDate,
            Date endDate);

    TestResults findLatestTest(int empId, int testId);
}
