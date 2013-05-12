package com.realty.agency.domain;

import java.io.Serializable;
import java.util.Date;

public class NormDto implements Serializable {
    private Integer id;
    private String activityTypeName;
    private Float norm;
    private Date changed;

    public NormDto() {
        
    }
    
    public NormDto(Integer tpId, String tpName, Float norm, Date changed) {
        this.id = tpId;
        this.activityTypeName = tpName;
        this.norm = norm;
        this.changed = changed;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer activityTypeId) {
        this.id = activityTypeId;
    }

    public String getActivityTypeName() {
        return activityTypeName;
    }

    public void setActivityTypeName(String activityTypeName) {
        this.activityTypeName = activityTypeName;
    }

    public Float getNorm() {
        return norm;
    }

    public void setNorm(Float norm) {
        this.norm = norm;
    }

    public Date getChanged() {
        return changed;
    }

    public void setChanged(Date changed) {
        this.changed = changed;
    }
}
