package com.realty.agency.dao;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.Rates;

@Transactional
public interface IRatesDao extends IDao<Rates> {
    List<Rates> findLastMonthEmpMeasureRates(Date startDate, Date endDate);

    List<Rates> calculateLastMonthEmpRates();
}
