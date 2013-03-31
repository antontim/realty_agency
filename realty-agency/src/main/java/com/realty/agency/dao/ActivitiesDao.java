package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.util.List;

import javax.naming.InitialContext;

import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.realty.agency.domain.Activities;

/**
 * Home object for domain model class Activities.
 * @see com.realty.agency.domain.Activities
 * @author Hibernate Tools
 */
public class ActivitiesDao {
    Logger logger = LoggerFactory.getLogger(ActivitiesDao.class);
    private static final Logger log = LoggerFactory.getLogger(ActivitiesDao.class);

    private final SessionFactory sessionFactory = getSessionFactory();

    protected SessionFactory getSessionFactory() {
        try {
            return (SessionFactory) new InitialContext()
                    .lookup("SessionFactory");
        } catch (Exception e) {
            log.error("Could not locate SessionFactory in JNDI", e);
            throw new IllegalStateException(
                    "Could not locate SessionFactory in JNDI");
        }
    }

    public void persist(Activities transientInstance) {
        log.debug("persisting Activities instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(Activities instance) {
        log.debug("attaching dirty Activities instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(Activities instance) {
        log.debug("attaching clean Activities instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(Activities persistentInstance) {
        log.debug("deleting Activities instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public Activities merge(Activities detachedInstance) {
        log.debug("merging Activities instance");
        try {
            Activities result = (Activities) sessionFactory.getCurrentSession()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public Activities findById(java.lang.Integer id) {
        log.debug("getting Activities instance with id: " + id);
        try {
            Activities instance = (Activities) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.Activities", id);
            if (instance == null) {
                log.debug("get successful, no instance found");
            } else {
                log.debug("get successful, instance found");
            }
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }

    public List<Activities> findByExample(Activities instance) {
        log.debug("finding Activities instance by example");
        try {
            List<Activities> results = (List<Activities>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.Activities")
                    .add(create(instance)).list();
            log.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }
}
