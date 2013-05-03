package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * EmployeeEvaluations generated by hbm2java
 */
@Entity
@Table(name = "employee_evaluations", catalog = "agency")
public class EmployeeEvaluations extends BaseEntity<Integer> implements java.io.Serializable, IEntity<Integer> {

    private Employees employees;
    private Questions questions;
    private Float mark;
    private Date created;

    public EmployeeEvaluations() {
    }

    public EmployeeEvaluations(int id) {
        this.id = id;
    }

    public EmployeeEvaluations(Employees employees, Questions questions,
            Float mark, Date created) {
        this.employees = employees;
        this.questions = questions;
        this.mark = mark;
        this.created = created;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id", nullable = false)
    public Employees getEmployees() {
        return this.employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "question_id", nullable = false)
    public Questions getQuestions() {
        return this.questions;
    }

    public void setQuestions(Questions questions) {
        this.questions = questions;
    }

    @Column(name = "mark", nullable = false, precision = 12, scale = 0)
    public Float getMark() {
        return this.mark;
    }

    public void setMark(Float mark) {
        this.mark = mark;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created", nullable = false, length = 19)
    public Date getCreated() {
        return this.created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

}
