package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TestResults generated by hbm2java
 */
@Entity
@Table(name = "test_results", catalog = "agency")
public class TestResults implements java.io.Serializable, IEntity<TestResultsId> {

    private TestResultsId id;
    private Employees employees;
    private Tests tests;
    private float result;

    public TestResults() {
    }

    public TestResults(TestResultsId id, Employees employees, Tests tests,
            float result) {
        this.id = id;
        this.employees = employees;
        this.tests = tests;
        this.result = result;
    }

    @EmbeddedId
    @AttributeOverrides({
            @AttributeOverride(name = "testId", column = @Column(name = "test_id", nullable = false)),
            @AttributeOverride(name = "employeeId", column = @Column(name = "employee_id", nullable = false)),
            @AttributeOverride(name = "passed", column = @Column(name = "passed", nullable = false, length = 10)) })
    public TestResultsId getId() {
        return this.id;
    }

    public void setId(TestResultsId id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id", nullable = false, insertable = false, updatable = false)
    public Employees getEmployees() {
        return this.employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "test_id", nullable = false, insertable = false, updatable = false)
    public Tests getTests() {
        return this.tests;
    }

    public void setTests(Tests tests) {
        this.tests = tests;
    }

    @Column(name = "result", nullable = false, precision = 12, scale = 0)
    public float getResult() {
        return this.result;
    }

    public void setResult(float result) {
        this.result = result;
    }

}
