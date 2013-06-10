package com.realty.agency.dao.hibernate;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.realty.agency.dao.IMeasureImportancesDao;
import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.MeasureTarget;

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

    @Override
    public List<MeasureImportances> find(MeasureImportances criteria) {
        try {
            
            Criteria crit = this.getSession()
                    .createCriteria(this.getEntityName()).add(create(criteria));
            if(criteria.getId() != null) {
                if(criteria.getId().getMeasure1Id() != null)
                    crit.add(Restrictions.eq("id.measure1Id", criteria.getId().getMeasure1Id()));
                if(criteria.getId().getMeasure2Id() != null)
                    crit.add(Restrictions.eq("id.measure2Id", criteria.getId().getMeasure2Id()));
            }
            crit.addOrder(Order.asc("id.measure1Id"));
            crit.addOrder(Order.asc("id.measure2Id"));

            @SuppressWarnings("unchecked")
            List<MeasureImportances> results = crit.list();
            return results;
        } catch (RuntimeException re) {
            throw re;
        }
    }

    @Override
    public List<MeasureImportances> find(MeasureImportances criteria, MeasureTarget mt) {
        try {
            
            Criteria crit = this.getSession()
                    .createCriteria(this.getEntityName())
                    .createAlias("measuresByMeasure1Id"
                            ,"m1"
                            ,Criteria.INNER_JOIN)
                    .createAlias("measuresByMeasure2Id"
                            ,"m2"
                            ,Criteria.INNER_JOIN)
                    .add(create(criteria));
            if(criteria.getId() != null) {
                if(criteria.getId().getMeasure1Id() != null)
                    crit.add(Restrictions.eq("id.measure1Id", criteria.getId().getMeasure1Id()));
                if(criteria.getId().getMeasure2Id() != null)
                    crit.add(Restrictions.eq("id.measure2Id", criteria.getId().getMeasure2Id()));
            }
            crit.add(Restrictions.eq("m1.measureTargetId", mt.getVal()));
            crit.add(Restrictions.eq("m2.measureTargetId", mt.getVal()));
            crit.addOrder(Order.asc("id.measure1Id"));
            crit.addOrder(Order.asc("id.measure2Id"));
            
            @SuppressWarnings("unchecked")
            List<MeasureImportances> results = crit.list();
            return results;
        } catch (RuntimeException re) {
            throw re;
        }
    }
}
