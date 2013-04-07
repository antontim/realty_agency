package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * TestResultsId generated by hbm2java
 */
@Embeddable
public class TestResultsId implements java.io.Serializable {

    private int testId;
    private int employeeId;
    private Date passed;

    public TestResultsId() {
    }

    public TestResultsId(int testId, int employeeId, Date passed) {
        this.testId = testId;
        this.employeeId = employeeId;
        this.passed = passed;
    }

    @Column(name = "test_id", nullable = false)
    public int getTestId() {
        return this.testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    @Column(name = "employee_id", nullable = false)
    public int getEmployeeId() {
        return this.employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    @Column(name = "passed", nullable = false, length = 10)
    public Date getPassed() {
        return this.passed;
    }

    public void setPassed(Date passed) {
        this.passed = passed;
    }

    public boolean equals(Object other) {
        if ((this == other))
            return true;
        if ((other == null))
            return false;
        if (!(other instanceof TestResultsId))
            return false;
        TestResultsId castOther = (TestResultsId) other;

        return (this.getTestId() == castOther.getTestId())
                && (this.getEmployeeId() == castOther.getEmployeeId())
                && ((this.getPassed() == castOther.getPassed()) || (this
                        .getPassed() != null && castOther.getPassed() != null && this
                        .getPassed().equals(castOther.getPassed())));
    }

    public int hashCode() {
        int result = 17;

        result = 37 * result + this.getTestId();
        result = 37 * result + this.getEmployeeId();
        result = 37 * result
                + (getPassed() == null ? 0 : this.getPassed().hashCode());
        return result;
    }

}