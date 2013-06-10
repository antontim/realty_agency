package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

import com.realty.agency.dao.IMeasureImportancesDao;
import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.MeasureImportancesId;
import com.realty.agency.domain.MeasureTarget;
import com.realty.agency.domain.Measures;

public class MeasureService implements IMeasureService {
    @Autowired
    private IMeasureImportancesDao measureImportancesDao;
    @Autowired
    private IMeasuresDao measuresDao;

    @Override
    public List<MeasureImportances> loadMeasureImportances(MeasureTarget mt) {
        return this.measureImportancesDao.find(new MeasureImportances(),mt);
    }

    @Override
    public List<Measures> loadMeasures(MeasureTarget mt) {
        return this.measuresDao.find(new Measures(),mt);
    }

    @Override
    public MeasureImportances updateImportance(int m1, int m2, float val) {
        List<MeasureImportances> mimps = this.measureImportancesDao
                .find(new MeasureImportances(new MeasureImportancesId(m2, m1),
                        null, null, null));
        if(mimps.size() != 1)
            throw new IncorrectResultSizeDataAccessException(1, mimps.size());
        mimps.get(0).setImportance(1/val);
        this.measureImportancesDao.update(mimps.get(0));
        
        mimps = this.measureImportancesDao
                .find(new MeasureImportances(new MeasureImportancesId(m1, m2),
                        null, null, null));
        if(mimps.size() != 1)
            throw new IncorrectResultSizeDataAccessException(1, mimps.size());
        mimps.get(0).setImportance(val);
        this.measureImportancesDao.update(mimps.get(0));
        return mimps.get(0);
    }
}
