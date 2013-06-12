package com.realty.agency.services;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.domain.MeasureTarget;

public class CompanyService implements ICompanyService {

    @Autowired
    private IMahService mahService;

    @Override
    public Float calcMah() {
        Map<Integer, Float> mahResults = this.mahService
                .calcMahResults(MeasureTarget.COMPANY);
        return mahResults.entrySet().iterator().next().getValue();
    }
}
