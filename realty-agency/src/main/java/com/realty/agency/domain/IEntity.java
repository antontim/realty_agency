package com.realty.agency.domain;

/**
 * 
 * @author anton
 *
 * @param <T> id type
 */
public interface IEntity<T> {
    T getId();

    void setId(T id);
}
