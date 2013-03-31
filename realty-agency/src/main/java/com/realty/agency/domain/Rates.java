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
 * Rates generated by hbm2java
 */
@Entity
@Table(name = "rates", catalog = "agency")
public class Rates implements java.io.Serializable {

    private RatesId id;
    private Employees employees;
    private Measures measures;
    private float value;

    public Rates() {
    }

    public Rates(RatesId id, Employees employees, Measures measures, float value) {
        this.id = id;
        this.employees = employees;
        this.measures = measures;
        this.value = value;
    }

    @EmbeddedId
    @AttributeOverrides({
            @AttributeOverride(name = "measureId", column = @Column(name = "measure_id", nullable = false)),
            @AttributeOverride(name = "employeeId", column = @Column(name = "employee_id", nullable = false)),
            @AttributeOverride(name = "created", column = @Column(name = "created", nullable = false, length = 19)) })
    public RatesId getId() {
        return this.id;
    }

    public void setId(RatesId id) {
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
    @JoinColumn(name = "measure_id", nullable = false, insertable = false, updatable = false)
    public Measures getMeasures() {
        return this.measures;
    }

    public void setMeasures(Measures measures) {
        this.measures = measures;
    }

    @Column(name = "value", nullable = false, precision = 12, scale = 0)
    public float getValue() {
        return this.value;
    }

    public void setValue(float value) {
        this.value = value;
    }

}
