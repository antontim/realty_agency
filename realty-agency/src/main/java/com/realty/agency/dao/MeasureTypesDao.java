package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.MeasureTypes;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class MeasureTypes.
 * @see com.realty.agency.domain.MeasureTypes
 * @author Hibernate Tools
 */
public class MeasureTypesDao {

    private static final Logger log = LoggerFactory.getLogger(MeasureTypesDao.class);

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

    public void persist(MeasureTypes transientInstance) {
        log.debug("persisting MeasureTypes instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(MeasureTypes instance) {
        log.debug("attaching dirty MeasureTypes instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(MeasureTypes instance) {
        log.debug("attaching clean MeasureTypes instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(MeasureTypes persistentInstance) {
        log.debug("deleting MeasureTypes instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public MeasureTypes merge(MeasureTypes detachedInstance) {
        log.debug("merging MeasureTypes instance");
        try {
            MeasureTypes result = (MeasureTypes) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public MeasureTypes findById(java.lang.Integer id) {
        log.debug("getting MeasureTypes instance with id: " + id);
        try {
            MeasureTypes instance = (MeasureTypes) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.MeasureTypes", id);
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

    public List<MeasureTypes> findByExample(MeasureTypes instance) {
        log.debug("finding MeasureTypes instance by example");
        try {
            List<MeasureTypes> results = (List<MeasureTypes>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.MeasureTypes")
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
