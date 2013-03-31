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
 * MeasureTypes generated by hbm2java
 */
@Entity
@Table(name = "measure_types", catalog = "agency")
public class MeasureTypes implements java.io.Serializable {

    private Integer id;
    private String name;
    private Set<Measures> measureses = new HashSet<Measures>(0);

    public MeasureTypes() {
    }

    public MeasureTypes(String name) {
        this.name = name;
    }

    public MeasureTypes(String name, Set<Measures> measureses) {
        this.name = name;
        this.measureses = measureses;
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

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "measureTypes")
    public Set<Measures> getMeasureses() {
        return this.measureses;
    }

    public void setMeasureses(Set<Measures> measureses) {
        this.measureses = measureses;
    }

}
