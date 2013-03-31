package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.Norms;
import com.realty.agency.domain.NormsId;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class Norms.
 * @see com.realty.agency.domain.Norms
 * @author Hibernate Tools
 */
public class NormsDao {

    private static final Logger log = LoggerFactory.getLogger(NormsDao.class);

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

    public void persist(Norms transientInstance) {
        log.debug("persisting Norms instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(Norms instance) {
        log.debug("attaching dirty Norms instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(Norms instance) {
        log.debug("attaching clean Norms instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(Norms persistentInstance) {
        log.debug("deleting Norms instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public Norms merge(Norms detachedInstance) {
        log.debug("merging Norms instance");
        try {
            Norms result = (Norms) sessionFactory.getCurrentSession().merge(
                    detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public Norms findById(com.realty.agency.domain.NormsId id) {
        log.debug("getting Norms instance with id: " + id);
        try {
            Norms instance = (Norms) sessionFactory.getCurrentSession().get(
                    "com.realty.agency.domain.Norms", id);
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

    public List<Norms> findByExample(Norms instance) {
        log.debug("finding Norms instance by example");
        try {
            List<Norms> results = (List<Norms>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.Norms")
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
