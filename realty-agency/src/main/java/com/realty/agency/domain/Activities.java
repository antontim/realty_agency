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
 * Activities generated by hbm2java
 */
@Entity
@Table(name = "activities", catalog = "agency")
public class Activities implements java.io.Serializable {

    private Integer id;
    private Employees employees;
    private ActivityTypes activityTypes;
    private Entities entities;
    private Date orderCreated;

    public Activities() {
    }

    public Activities(Employees employees, ActivityTypes activityTypes,
            Entities entities, Date orderCreated) {
        this.employees = employees;
        this.activityTypes = activityTypes;
        this.entities = entities;
        this.orderCreated = orderCreated;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "employee_id", nullable = false)
    public Employees getEmployees() {
        return this.employees;
    }

    public void setEmployees(Employees employees) {
        this.employees = employees;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "activity_type_id", nullable = false)
    public ActivityTypes getActivityTypes() {
        return this.activityTypes;
    }

    public void setActivityTypes(ActivityTypes activityTypes) {
        this.activityTypes = activityTypes;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "entity_id", nullable = false)
    public Entities getEntities() {
        return this.entities;
    }

    public void setEntities(Entities entities) {
        this.entities = entities;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "order_created", nullable = false, length = 19)
    public Date getOrderCreated() {
        return this.orderCreated;
    }

    public void setOrderCreated(Date orderCreated) {
        this.orderCreated = orderCreated;
    }

}