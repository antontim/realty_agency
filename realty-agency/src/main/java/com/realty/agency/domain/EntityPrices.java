package com.realty.agency.domain;

// Generated Apr 1, 2013 12:12:11 AM by Hibernate Tools 3.4.0.CR1

import java.util.Date;

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
 * EntityPrices generated by hbm2java
 */
@Entity
@Table(name = "entity_prices", catalog = "agency")
public class EntityPrices implements java.io.Serializable, IEntity<EntityPricesId> {
    private EntityPricesId id;
    private Entities entities;
    private Float price;

    public EntityPrices() {
    }
    
    public EntityPrices(Integer id, Float price) {
        this.id = new EntityPricesId(id, new Date());
        this.price = price;
    }

    public EntityPrices(EntityPricesId id, Entities entities, float price) {
        this.id = id;
        this.entities = entities;
        this.price = price;
    }

    @EmbeddedId
    @AttributeOverrides({
            @AttributeOverride(name = "id", column = @Column(name = "id", nullable = false)),
            @AttributeOverride(name = "created", column = @Column(name = "created", nullable = false, length = 19)) })
    public EntityPricesId getId() {
        return this.id;
    }

    public void setId(EntityPricesId id) {
        this.id = id;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id", nullable = false, insertable = false, updatable = false)
    public Entities getEntities() {
        return this.entities;
    }

    public void setEntities(Entities entities) {
        this.entities = entities;
    }

    @Column(name = "price", nullable = false, precision = 12, scale = 0)
    public Float getPrice() {
        return this.price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

}
