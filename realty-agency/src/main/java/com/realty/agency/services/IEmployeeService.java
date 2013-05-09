package com.realty.agency.services;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.realty.agency.domain.EmployeeEvaluations;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Positions;
import com.realty.agency.domain.Rates;
import com.realty.agency.domain.TestResults;

public interface IEmployeeService {
    Employees loadEmployeeByName(String name);

    Employees loadEmployeeById(int id);

    List<Employees> loadEmployees(Employees criteria);

    Employees addEmployee(String name, int posId);

    void deleteEmployee(int id);

    void updateEmployee(int id, String name, int pos);

    List<Positions> loadAllPositions();

    List<EmployeeEvaluations> loadAllEmpEvaluationsByRange(int id, Date startDate, Date endDate);

    EmployeeEvaluations addEmpEvaluation(int id, int questionId, float mark);

    void deleteEmpEvaluation(int id);

    EmployeeEvaluations updateEmpEvaluation(int id, float mark);

    List<TestResults> loadAllTestResultsByRange(int empId, Date startDate,
            Date endDate);

    TestResults addTestResult(int testId, int empId, float res);

    TestResults updateTestResult(int testId, int empId, Date passed, float res);

    void deleteTestResult(int testId, int empId, Date passed);

    List<Measures> loadMeasureRates(int empId);

    List<Rates> calculateMonthEmpRates();

    void updateEmployeeMah();
}
