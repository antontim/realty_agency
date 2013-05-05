package com.realty.agency.domain;

// Generated May 5, 2013 5:39:19 PM by Hibernate Tools 3.4.0.CR1

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Users generated by hbm2java
 */
@Entity
@Table(name = "users", catalog = "users")
public class Users implements java.io.Serializable, IEntity<String> {

    private String id;
    private String password;
    private Boolean enabled = true;
    private Set<Authorities> authorities;

    public Users() {
    }

    public Users(String id, String password) {
        this.id = id;
        this.password = password;
    }

    @Id
    @Column(name = "username", unique = true, nullable = false, length = 50)
    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "password", nullable = false, length = 50)
    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "enabled", nullable = false)
    public Boolean isEnabled() {
        return this.enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "users")
    public Set<Authorities> getAuthorities() {
        return this.authorities;
    }

    public void setAuthorities(Set<Authorities> authorities) {
        this.authorities = authorities;
    }
}
