package com.realty.agency.services;

import java.util.Date;
import java.util.List;

import com.realty.agency.domain.Activities;
import com.realty.agency.domain.NormDto;

public interface IActivityService {
    List<Activities> loadActivities(Date startDate,
            Date endDate);

    Activities createActivity(int entId, int actTpId);

    Activities updateActivity(Activities activity);

    void deleteActivity(int id);

    List<NormDto> loadNorms();

    void updateNorm(Integer actTpId, Float val);
}
