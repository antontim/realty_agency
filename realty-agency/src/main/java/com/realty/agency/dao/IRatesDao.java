package com.realty.agency.dao;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.Rates;

@Transactional
public interface IRatesDao extends IDao<Rates> {

}
