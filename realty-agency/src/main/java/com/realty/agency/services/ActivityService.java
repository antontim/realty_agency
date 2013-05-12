package com.realty.agency.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IActivitiesDao;
import com.realty.agency.dao.IActivityTypesDao;
import com.realty.agency.dao.IEmployeesDao;
import com.realty.agency.dao.INormsDao;
import com.realty.agency.domain.Activities;
import com.realty.agency.domain.ActivityTypes;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.Entities;
import com.realty.agency.domain.NormDto;
import com.realty.agency.domain.Norms;

public class ActivityService implements IActivityService {
    @Autowired
    private IActivitiesDao activitiesDao;
    @Autowired
    private IActivityTypesDao activityTypesDao;
    @Autowired
    private IEmployeesDao employeesDao;
    @Autowired
    private INormsDao normsDao;
    @Autowired
    private IEntityService entityService;

    @Override
    public List<Activities> loadActivities(Date startDate, Date endDate) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        Integer empId = null;
        if (this.containsRoles(userDetails.getAuthorities(),"ROLE_SALESMAN","ROLE_RENTER")) {
            empId = this.employeesDao
                    .find(new Employees(userDetails.getUsername())).get(0).getId();
        }
        return this.activitiesDao.findByEmpAndDateRange(empId, startDate,
                endDate);
    }

    private boolean containsRoles(Collection<? extends GrantedAuthority> auth, String...roles) {
        for(GrantedAuthority each : auth) {
            for(String role : roles) {
                if(each.getAuthority().equals(role))
                    return true;
            }
        }
        return false;
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

    @Override
    public List<NormDto> loadNorms() {
        List<ActivityTypes> tps = this.activityTypesDao
                .find(new ActivityTypes());
        List<Norms> nrms = this.normsDao.find(new Norms());

        List<NormDto> res = new ArrayList<NormDto>();
        for (ActivityTypes tp : tps) {
            for (Norms nrm : nrms) {
                if (nrm.getId().equals(tp.getId())) {
                    res.add(new NormDto(tp.getId(), tp.getName(), nrm
                            .getMonthNorm(),nrm.getChanged()));
                }
            }
        }
        return res;
    }

    @Override
    public void updateNorm(Integer actTpId, Float val) {
        this.normsDao.update(new Norms(actTpId, new Date(), val));
    }
}
