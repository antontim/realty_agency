package com.realty.agency.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface IDao<T> {
    /**
     * Searches for records in database by given criteria object. <br>
     * In case no records found returns empty list.
     * 
     * @param criteria
     *            criteria object
     * @return list of found by given criteria records, or empty list if no
     *         records is found.
     */
    List<T> find(T criteria);

    /**
     * Inserts given record to the database.
     * 
     * @param rec
     *            record to save.
     */
    void add(T rec);

    /**
     * Removes given record from the database.
     * 
     * @param rec
     *            record to remove.
     */
    void delete(T rec);

    /**
     * Updates given record.
     * 
     * @param rec
     *            record to update.
     * @return updated record
     */
    T update(T rec);
}
