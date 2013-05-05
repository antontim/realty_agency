package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Employees generated by hbm2java
 */
@Entity
@Table(name = "employees", catalog = "agency")
public class Employees extends BaseEntity<Integer> implements java.io.Serializable, IEntity<Integer> {

    private Positions positions;
    private String name;
    private float mahResult;
    private Set<Activities> activitieses = new HashSet<Activities>(0);
    private Set<EmployeeEvaluations> employeeEvaluationses = new HashSet<EmployeeEvaluations>(
            0);
    private Set<Rates> rateses = new HashSet<Rates>(0);
    private Set<TestResults> testResultses = new HashSet<TestResults>(0);
    private Users users;

    public Employees() {
    }

    public Employees(int id) {
        this.id = id;
    }

    public Employees(String username) {
        this.users = new Users(username, null);
    }

    public Employees(Positions positions, String name, float mahResult) {
        this.positions = positions;
        this.name = name;
        this.mahResult = mahResult;
    }

    public Employees(Positions positions, String name, float mahResult,
            Set<Activities> activitieses,
            Set<EmployeeEvaluations> employeeEvaluationses, Set<Rates> rateses,
            Set<TestResults> testResultses) {
        this.positions = positions;
        this.name = name;
        this.mahResult = mahResult;
        this.activitieses = activitieses;
        this.employeeEvaluationses = employeeEvaluationses;
        this.rateses = rateses;
        this.testResultses = testResultses;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "position_id", nullable = false)
    public Positions getPositions() {
        return this.positions;
    }

    public void setPositions(Positions positions) {
        this.positions = positions;
    }

    @Column(name = "name", nullable = false, length = 30)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "mah_result", nullable = false, precision = 12, scale = 0)
    public float getMahResult() {
        return this.mahResult;
    }

    public void setMahResult(float mahResult) {
        this.mahResult = mahResult;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employees")
    public Set<Activities> getActivitieses() {
        return this.activitieses;
    }

    public void setActivitieses(Set<Activities> activitieses) {
        this.activitieses = activitieses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employees")
    public Set<EmployeeEvaluations> getEmployeeEvaluationses() {
        return this.employeeEvaluationses;
    }

    public void setEmployeeEvaluationses(
            Set<EmployeeEvaluations> employeeEvaluationses) {
        this.employeeEvaluationses = employeeEvaluationses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employees")
    public Set<Rates> getRateses() {
        return this.rateses;
    }

    public void setRateses(Set<Rates> rateses) {
        this.rateses = rateses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employees")
    public Set<TestResults> getTestResultses() {
        return this.testResultses;
    }

    public void setTestResultses(Set<TestResults> testResultses) {
        this.testResultses = testResultses;
    }

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "username", nullable = false)
    public Users getUsers() {
        return this.users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
}
