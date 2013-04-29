package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Depts generated by hbm2java
 */
@Entity
@Table(name = "depts", catalog = "agency")
public class Depts extends BaseEntity<Integer> implements java.io.Serializable, IEntity<Integer> {

    private String name;
    private Set<Positions> positionses = new HashSet<Positions>(0);

    public Depts() {
    }

    public Depts(String name) {
        this.name = name;
    }

    public Depts(String name, Set<Positions> positionses) {
        this.name = name;
        this.positionses = positionses;
    }

    @Column(name = "name", nullable = false, length = 45)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "depts")
    public Set<Positions> getPositionses() {
        return this.positionses;
    }

    public void setPositionses(Set<Positions> positionses) {
        this.positionses = positionses;
    }

}
