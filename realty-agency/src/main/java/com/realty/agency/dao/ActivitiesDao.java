package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.domain.Activities;

/**
 * ActivitiesDao object for domain model class Activities.
 * @see com.realty.agency.domain.Activities
 * @author Hibernate Tools
 */
public class ActivitiesDao {
    private Logger logger = LoggerFactory.getLogger(ActivitiesDao.class);

    @Autowired
    private SessionFactory sessionFactory;

    public void persist(Activities transientInstance) {
        logger.debug("persisting Activities instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            logger.debug("persist successful");
        } catch (RuntimeException re) {
            logger.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(Activities instance) {
        logger.debug("attaching dirty Activities instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(Activities instance) {
        logger.debug("attaching clean Activities instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    public void delete(Activities persistentInstance) {
        logger.debug("deleting Activities instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            logger.debug("delete successful");
        } catch (RuntimeException re) {
            logger.error("delete failed", re);
            throw re;
        }
    }

    public Activities merge(Activities detachedInstance) {
        logger.debug("merging Activities instance");
        try {
            Activities result = (Activities) sessionFactory.getCurrentSession()
                    .merge(detachedInstance);
            logger.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            logger.error("merge failed", re);
            throw re;
        }
    }

    public Activities findById(java.lang.Integer id) {
        logger.debug("getting Activities instance with id: " + id);
        try {
            Activities instance = (Activities) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.Activities", id);
            if (instance == null) {
                logger.debug("get successful, no instance found");
            } else {
                logger.debug("get successful, instance found");
            }
            return instance;
        } catch (RuntimeException re) {
            logger.error("get failed", re);
            throw re;
        }
    }

    public List<Activities> findByExample(Activities instance) {
        logger.debug("finding Activities instance by example");
        try {
            List<Activities> results = (List<Activities>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.Activities")
                    .add(create(instance)).list();
            logger.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            logger.error("find by example failed", re);
            throw re;
        }
    }
}
