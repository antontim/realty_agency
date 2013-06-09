package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Entities generated by hbm2java
 */
@Entity
@Table(name = "entities", catalog = "agency")
public class Entities extends BaseEntity<Integer> implements java.io.Serializable, IEntity<Integer> {

    private EntityTypes entityTypes;
    private EntityClass entityClass;
    private List<EntityPrices> entityPriceses = new ArrayList<EntityPrices>(0);
    private Set<Activities> activitieses = new HashSet<Activities>(0);
    private String addrCity;
    private String addrStreet;
    private String addrHouse;
    private String addrAppartment;
    private Byte active;

    public Entities() {
    }

    public Entities(Integer id) {
        this.id = id;
    }

    public Entities(EntityTypes entityTypes, EntityClass entityClass) {
        this.entityTypes = entityTypes;
        this.entityClass = entityClass;
    }

    public Entities(EntityTypes entityTypes, EntityClass entityClass,
            List<EntityPrices> entityPriceses, Set<Activities> activitieses) {
        this.entityTypes = entityTypes;
        this.entityClass = entityClass;
        this.entityPriceses = entityPriceses;
        this.activitieses = activitieses;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "entity_type_id", nullable = false)
    public EntityTypes getEntityTypes() {
        return this.entityTypes;
    }

    public void setEntityTypes(EntityTypes entityTypes) {
        this.entityTypes = entityTypes;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "entity_class_id", nullable = false)
    public EntityClass getEntityClass() {
        return this.entityClass;
    }

    public void setEntityClass(EntityClass entityClass) {
        this.entityClass = entityClass;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "entities")
    public List<EntityPrices> getEntityPriceses() {
        return this.entityPriceses;
    }

    public void setEntityPriceses(List<EntityPrices> entityPriceses) {
        this.entityPriceses = entityPriceses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "entities")
    public Set<Activities> getActivitieses() {
        return this.activitieses;
    }

    public void setActivitieses(Set<Activities> activitieses) {
        this.activitieses = activitieses;
    }

    @Column(name = "active", nullable = false)
    public Byte getActive() {
        return active;
    }

    public void setActive(Byte active) {
        this.active = active;
    }

    @Column(name = "addr_city", nullable = false, length = 20)
    public String getAddrCity() {
        return addrCity;
    }

    public void setAddrCity(String addrCity) {
        this.addrCity = addrCity;
    }

    @Column(name = "addr_street", nullable = false, length = 25)
    public String getAddrStreet() {
        return addrStreet;
    }

    public void setAddrStreet(String addrStreet) {
        this.addrStreet = addrStreet;
    }

    @Column(name = "addr_house", nullable = false, length = 10)
    public String getAddrHouse() {
        return addrHouse;
    }

    public void setAddrHouse(String addrHouse) {
        this.addrHouse = addrHouse;
    }

    @Column(name = "addr_appartment", nullable = false, length = 10)
    public String getAddrAppartment() {
        return addrAppartment;
    }

    public void setAddrAppartment(String addrAppartment) {
        this.addrAppartment = addrAppartment;
    }
}
