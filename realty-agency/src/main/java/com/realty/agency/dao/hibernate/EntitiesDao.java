package com.realty.agency.dao.hibernate;

import static org.hibernate.criterion.Example.create;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.realty.agency.dao.IEntitiesDao;
import com.realty.agency.domain.Entities;
import com.realty.agency.domain.EntityPrices;

/**
 * Home object for domain model class Entities.
 * 
 * @see com.realty.agency.domain.Entities
 */
public class EntitiesDao extends HibernateDao<Entities> implements IEntitiesDao {
    private static final Logger logger = LoggerFactory
            .getLogger(EntitiesDao.class);

    public EntitiesDao() {
        super.setEntityName("com.realty.agency.domain.Entities");
    }

    @Override
    public List<Entities> find(Entities criteria) {
        logger.debug("finding instance by example");
        try {
            Criteria crit = this.getSession()
                    .createCriteria(Entities.class,"ent")
                    .createAlias("entityPriceses","pr",Criteria.LEFT_JOIN)
                    .createAlias("entityPriceses.id","priceId",Criteria.LEFT_JOIN)
                    .add(create(criteria));
            if(criteria.getId() != null) {
                crit.add(Restrictions.eq("ent.id", criteria.getId()));
            }
            DetachedCriteria maxDateQuery = DetachedCriteria
                    .forClass(EntityPrices.class);
            maxDateQuery.setProjection(Projections.projectionList()
                    .add(Projections.max("id.created")))
                    .add(Restrictions.eqProperty("id.id", "pr.id.id"));
            crit.add(Subqueries.propertyEq("pr.id.created", maxDateQuery));

            @SuppressWarnings("unchecked")
            List<Entities> results = crit.list();
            logger.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            logger.error("find by example failed", re);
            throw re;
        }
    }

    @Override
    public void add(Entities rec) {
        rec.setCreated(new Date());
        super.add(rec);
    }
}
