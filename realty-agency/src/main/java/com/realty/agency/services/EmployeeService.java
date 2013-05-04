package com.realty.agency.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IEmployeeEvaluationsDao;
import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.dao.IPositionsDao;
import com.realty.agency.dao.ITestResultsDao;
import com.realty.agency.domain.EmployeeEvaluations;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Positions;
import com.realty.agency.domain.Questions;
import com.realty.agency.domain.TestResults;
import com.realty.agency.domain.TestResultsId;

public class EmployeeService implements IEmployeeService {

    @Autowired
    private IEmployeesDao employeesDao;
    @Autowired
    private IEmployeeEvaluationsDao employeeEvaluationsDao;
    @Autowired
    private ITestResultsDao testResultsDao;
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

    @Override
    public List<EmployeeEvaluations> loadAllEmpEvaluationsByRange(int id,
            Date startDate, Date endDate) {
        return this.employeeEvaluationsDao.findByRange(id, startDate, endDate);
    }

    @Override
    public EmployeeEvaluations addEmpEvaluation(int id, int questionId,
            float mark) {
        EmployeeEvaluations eval = new EmployeeEvaluations(new Employees(id),
                new Questions(questionId), mark, new Date());
        this.employeeEvaluationsDao.add(eval);

        List<EmployeeEvaluations> evals = this.employeeEvaluationsDao
                .find(new EmployeeEvaluations(eval.getId()));

        return CollectionUtils.isEmpty(evals) ? null : evals.get(0);
    }

    @Override
    public EmployeeEvaluations updateEmpEvaluation(int id, float mark) {
        List<EmployeeEvaluations> empEvals = this.employeeEvaluationsDao
                .find(new EmployeeEvaluations(id));
        if (CollectionUtils.isEmpty(empEvals))
            throw new IncorrectResultSizeDataAccessException(1, 0);
        EmployeeEvaluations empEval = empEvals.get(0);

        empEval.setMark(mark);
        this.employeeEvaluationsDao.update(empEval);
        return empEval;
    }

    @Override
    public void deleteEmpEvaluation(int id) {
        this.employeeEvaluationsDao.delete(new EmployeeEvaluations(id));
    }

    @Override
    public List<TestResults> loadAllTestResultsByRange(int empId,
            Date startDate, Date endDate) {
        return this.testResultsDao.findByEmpAndDateRange(empId, startDate,
                endDate);
    }

    @Override
    public TestResults addTestResult(int testId, int empId, float res) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.MILLISECOND, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.HOUR, 0);
        TestResults testRes = new TestResults(new TestResultsId(testId, empId,
                cal.getTime()), null, null, res);
        this.testResultsDao.add(testRes);

        List<TestResults> testResults = this.testResultsDao
                .find(new TestResults(testRes.getId()));

        return CollectionUtils.isEmpty(testResults) ? null : testResults.get(0);
    }

    @Override
    public TestResults updateTestResult(int testId, int empId, Date passed,
            float res) {
        List<TestResults> empTestResults = this.testResultsDao
                .find(new TestResults(new TestResultsId(testId, empId, passed)));
        if (CollectionUtils.isEmpty(empTestResults))
            throw new IncorrectResultSizeDataAccessException(1, 0);
        TestResults empTestRes = empTestResults.get(0);

        empTestRes.setResult(res);
        this.testResultsDao.update(empTestRes);
        return empTestRes;
    }

    @Override
    public void deleteTestResult(int testId, int empId, Date passed) {
        this.testResultsDao.delete(new TestResults(new TestResultsId(testId,
                empId, passed)));
    }
}
