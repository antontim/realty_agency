package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IActivitiesDao;
import com.realty.agency.domain.Activities;

public class ActivityService implements IActivityService {
    @Autowired
    private IActivitiesDao activitiesDao;

    @Override
    public List<Activities> loadActivities(Activities criteria) {
        return this.activitiesDao.find(criteria);
    }

    @Override
    public Activities createActivity(Activities activity) {
        this.activitiesDao.add(activity);
        List<Activities> added = this.activitiesDao.find(activity);
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
