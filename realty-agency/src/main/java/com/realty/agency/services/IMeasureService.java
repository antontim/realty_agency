package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.Measures;

public interface IMeasureService {
    List<MeasureImportances> loadMeasureImportances();

    List<Measures> loadMeasures();

    MeasureImportances updateImportance(int m1, int m2, float val);
}
