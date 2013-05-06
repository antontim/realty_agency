package com.realty.agency.dao.hibernate;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Rates;

/**
 * Home object for domain model class Measures.
 * 
 * @see com.realty.agency.domain.Measures
 */
public class MeasuresDao extends HibernateDao<Measures> implements IMeasuresDao {

    private Logger logger = LoggerFactory.getLogger(MeasuresDao.class);

    public MeasuresDao() {
        super.setEntityName("com.realty.agency.domain.Measures");
    }

    @Override
    public List<Measures> findMeasureRatesForEmp(int empId) {
            logger.debug("finding instance by example");
            try {
                Criteria crit = this.getSession()
                        .createCriteria(Measures.class,"ms")
                        .createAlias("rateses"
                                ,"rt"
                                ,Criteria.LEFT_JOIN
                                ,Restrictions.eq("rt.id.employeeId", empId));

                DetachedCriteria maxDateQuery = DetachedCriteria
                        .forClass(Rates.class);
                maxDateQuery.setProjection(Projections.projectionList()
                        .add(Projections.max("id.created")))
                        .add(Restrictions.eqProperty("id.measureId", "ms.id"))
                        .add(Restrictions.eq("id.employeeId", empId));
                crit.add(Restrictions.disjunction()
                        .add(Subqueries.propertyEq("rt.id.created", maxDateQuery))
                        .add(Restrictions.isNull("rt.id.created")));

                @SuppressWarnings("unchecked")
                List<Measures> results = crit.list();
                logger.debug("find by example successful, result size: "
                        + results.size());
                return results;
            } catch (RuntimeException re) {
                logger.error("find by example failed", re);
                throw re;
            }
    }

    @Override
    public List<Measures> find(Measures criteria) {
        logger.debug("finding instance by example");
        try {
            
            Criteria crit = this.getSession()
                    .createCriteria(this.getEntityName()).add(create(criteria));
            if(criteria.getId() != null) {
                crit.add(Restrictions.eq("id", criteria.getId()));
            }
            crit.addOrder(Order.asc("id"));

            @SuppressWarnings("unchecked")
            List<Measures> results = crit.list();
            logger.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            logger.error("find by example failed", re);
            throw re;
        }
    }

}
