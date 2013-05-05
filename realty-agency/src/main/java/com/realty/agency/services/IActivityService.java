package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Activities;

public interface IActivityService {
    List<Activities> loadActivities(Activities criteria);

    Activities createActivity(int entId, int actTpId);

    Activities updateActivity(Activities activity);

    void deleteActivity(int id);
}
