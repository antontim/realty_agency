package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IMeasureImportancesDao;
import com.realty.agency.domain.MeasureImportances;

/**
 * Home object for domain model class MeasureImportances.
 * 
 * @see com.realty.agency.domain.MeasureImportances
 */
public class MeasureImportancesDao extends HibernateDao<MeasureImportances>
        implements IMeasureImportancesDao {

    public MeasureImportancesDao() {
        super.setEntityName("com.realty.agency.domain.MeasureImportances");
    }
}
