package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Tests generated by hbm2java
 */
@Entity
@Table(name = "tests", catalog = "agency")
public class Tests implements java.io.Serializable {

    private Integer id;
    private String name;
    private String type;
    private Set<TestResults> testResultses = new HashSet<TestResults>(0);

    public Tests() {
    }

    public Tests(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public Tests(String name, String type, Set<TestResults> testResultses) {
        this.name = name;
        this.type = type;
        this.testResultses = testResultses;
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

    @Column(name = "name", nullable = false, length = 20)
    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "type", nullable = false, length = 10)
    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "tests")
    public Set<TestResults> getTestResultses() {
        return this.testResultses;
    }

    public void setTestResultses(Set<TestResults> testResultses) {
        this.testResultses = testResultses;
    }

}