package com.realty.agency.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IDeptsDao;
import com.realty.agency.domain.Depts;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.MeasureTarget;

public class DeptService implements IDeptService {

    @Autowired
    private IDeptsDao deptsDao;
    @Autowired
    private IMahService mahService;

    @Override
    public List<Depts> loadDepts() {
        return this.deptsDao.find(new Depts());
    }

    @Override
    public void updateDeptMah() {
        Map<Integer, Float> empMahResults = this.mahService.calcMahResults(MeasureTarget.DEPT);
        for(Map.Entry<Integer, Float> each : empMahResults.entrySet()) {
            Depts rec = new Depts();
            rec.setId(each.getKey());
            List<Depts> deptsList = deptsDao.find(rec);
            rec = deptsList.get(0);
            rec.setMahResult(each.getValue());
            this.deptsDao.update(rec);
        }
    }
}
