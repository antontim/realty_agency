package com.realty.agency.services;

import java.util.Map;

import com.realty.agency.domain.MeasureTarget;

public interface IMahService {
    Map<Integer, Float> calcMahResults(MeasureTarget mt);
}
