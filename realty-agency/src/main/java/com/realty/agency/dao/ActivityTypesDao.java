package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.ActivityTypes;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class ActivityTypes.
 * @see com.realty.agency.domain.ActivityTypes
 * @author Hibernate Tools
 */
public class ActivityTypesDao {

    private static final Logger log = LoggerFactory.getLogger(ActivityTypesDao.class);

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

    public void persist(ActivityTypes transientInstance) {
        log.debug("persisting ActivityTypes instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(ActivityTypes instance) {
        log.debug("attaching dirty ActivityTypes instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(ActivityTypes instance) {
        log.debug("attaching clean ActivityTypes instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(ActivityTypes persistentInstance) {
        log.debug("deleting ActivityTypes instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public ActivityTypes merge(ActivityTypes detachedInstance) {
        log.debug("merging ActivityTypes instance");
        try {
            ActivityTypes result = (ActivityTypes) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public ActivityTypes findById(java.lang.Integer id) {
        log.debug("getting ActivityTypes instance with id: " + id);
        try {
            ActivityTypes instance = (ActivityTypes) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.ActivityTypes", id);
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

    public List<ActivityTypes> findByExample(ActivityTypes instance) {
        log.debug("finding ActivityTypes instance by example");
        try {
            List<ActivityTypes> results = (List<ActivityTypes>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.ActivityTypes")
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
