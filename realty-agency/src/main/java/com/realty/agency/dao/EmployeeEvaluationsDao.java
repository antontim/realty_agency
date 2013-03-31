package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.EmployeeEvaluations;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class EmployeeEvaluations.
 * @see com.realty.agency.domain.EmployeeEvaluations
 * @author Hibernate Tools
 */
public class EmployeeEvaluationsDao {

    private static final Logger log = LoggerFactory
            .getLogger(EmployeeEvaluationsDao.class);

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

    public void persist(EmployeeEvaluations transientInstance) {
        log.debug("persisting EmployeeEvaluations instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(EmployeeEvaluations instance) {
        log.debug("attaching dirty EmployeeEvaluations instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(EmployeeEvaluations instance) {
        log.debug("attaching clean EmployeeEvaluations instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(EmployeeEvaluations persistentInstance) {
        log.debug("deleting EmployeeEvaluations instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public EmployeeEvaluations merge(EmployeeEvaluations detachedInstance) {
        log.debug("merging EmployeeEvaluations instance");
        try {
            EmployeeEvaluations result = (EmployeeEvaluations) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public EmployeeEvaluations findById(java.lang.Integer id) {
        log.debug("getting EmployeeEvaluations instance with id: " + id);
        try {
            EmployeeEvaluations instance = (EmployeeEvaluations) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.EmployeeEvaluations", id);
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

    public List<EmployeeEvaluations> findByExample(EmployeeEvaluations instance) {
        log.debug("finding EmployeeEvaluations instance by example");
        try {
            List<EmployeeEvaluations> results = (List<EmployeeEvaluations>) sessionFactory
                    .getCurrentSession()
                    .createCriteria(
                            "com.realty.agency.domain.EmployeeEvaluations")
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
