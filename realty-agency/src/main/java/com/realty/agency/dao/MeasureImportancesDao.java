package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.MeasureImportancesId;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class MeasureImportances.
 * @see com.realty.agency.domain.MeasureImportances
 * @author Hibernate Tools
 */
public class MeasureImportancesDao {

    private static final Logger log = LoggerFactory
            .getLogger(MeasureImportancesDao.class);

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

    public void persist(MeasureImportances transientInstance) {
        log.debug("persisting MeasureImportances instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(MeasureImportances instance) {
        log.debug("attaching dirty MeasureImportances instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(MeasureImportances instance) {
        log.debug("attaching clean MeasureImportances instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(MeasureImportances persistentInstance) {
        log.debug("deleting MeasureImportances instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public MeasureImportances merge(MeasureImportances detachedInstance) {
        log.debug("merging MeasureImportances instance");
        try {
            MeasureImportances result = (MeasureImportances) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public MeasureImportances findById(
            com.realty.agency.domain.MeasureImportancesId id) {
        log.debug("getting MeasureImportances instance with id: " + id);
        try {
            MeasureImportances instance = (MeasureImportances) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.MeasureImportances", id);
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

    public List<MeasureImportances> findByExample(MeasureImportances instance) {
        log.debug("finding MeasureImportances instance by example");
        try {
            List<MeasureImportances> results = (List<MeasureImportances>) sessionFactory
                    .getCurrentSession()
                    .createCriteria(
                            "com.realty.agency.domain.MeasureImportances")
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
