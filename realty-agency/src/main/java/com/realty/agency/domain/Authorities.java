package com.realty.agency.domain;

// Generated May 5, 2013 5:39:19 PM by Hibernate Tools 3.4.0.CR1

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Authorities generated by hbm2java
 */
@Entity
@Table(name = "authorities", catalog = "users", uniqueConstraints = @UniqueConstraint(columnNames = {
        "username", "authority" }))
public class Authorities implements IEntity<AuthoritiesId>, java.io.Serializable {

    private AuthoritiesId id;

    public Authorities() {
    }

    public Authorities(AuthoritiesId id) {
        this.id = id;
    }

    @EmbeddedId
    @AttributeOverrides({
            @AttributeOverride(name = "username", column = @Column(name = "username", nullable = false, length = 50)),
            @AttributeOverride(name = "authority", column = @Column(name = "authority", nullable = false, length = 50)) })
    public AuthoritiesId getId() {
        return this.id;
    }

    public void setId(AuthoritiesId id) {
        this.id = id;
    }
}
