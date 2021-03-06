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
import javax.persistence.Table;

/**
 * Positions generated by hbm2java
 */
@Entity
@Table(name = "positions", catalog = "agency")
public class Positions extends BaseEntity<Integer> implements java.io.Serializable, IEntity<Integer> {

    private Depts depts;
    private String name;
    private Set<Employees> employeeses = new HashSet<Employees>(0);

    public Positions() {
    }

    public Positions(Depts depts, String name) {
        this.depts = depts;
        this.name = name;
    }

    public Positions(Depts depts, String name, Set<Employees> employeeses) {
        this.depts = depts;
        this.name = name;
        this.employeeses = employeeses;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "dept_id", nullable = false)
    public Depts getDepts() {
        return this.depts;
    }

    public void setDepts(Depts depts) {
        this.depts = depts;
    }

    @Column(name = "name", nullable = false, length = 20)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "positions")
    public Set<Employees> getEmployeeses() {
        return this.employeeses;
    }

    public void setEmployeeses(Set<Employees> employeeses) {
        this.employeeses = employeeses;
    }

}
