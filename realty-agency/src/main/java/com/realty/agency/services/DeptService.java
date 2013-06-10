package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IDeptsDao;
import com.realty.agency.domain.Depts;

public class DeptService implements IDeptService {

    @Autowired
    private IDeptsDao deptsDao;

    @Override
    public List<Depts> loadDepts() {
        return this.deptsDao.find(new Depts());
    }

}
