package com.realty.agency.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IActivitiesDao;
import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.domain.Activities;
import com.realty.agency.domain.ActivityTypes;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Entities;

public class ActivityService implements IActivityService {
    @Autowired
    private IActivitiesDao activitiesDao;
    @Autowired
    private IEmployeesDao employeesDao;
    
    @Autowired
    private IEntityService entityService;

    @Override
    public List<Activities> loadActivities(Activities criteria) {
        return this.activitiesDao.find(criteria);
    }

    @Override
    public Activities createActivity(int entId, int actTpId) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Integer empId = this.employeesDao
                .find(new Employees(userDetails.getUsername())).get(0).getId();

        Activities activity = new Activities(new Employees(empId),
                new ActivityTypes(actTpId), new Entities(entId), new Date());
        this.activitiesDao.add(activity);

        this.entityService.disableEntity(entId);

        List<Activities> added = this.activitiesDao.find(new Activities(
                activity.getId()));
        return CollectionUtils.isEmpty(added) ? null : added.get(0);
    }

    @Override
    public Activities updateActivity(Activities activity) {
        return this.activitiesDao.update(activity);
    }

    @Override
    public void deleteActivity(int id) {
        Activities activity = new Activities();
        activity.setId(id);
        this.activitiesDao.delete(activity);
    }
}
