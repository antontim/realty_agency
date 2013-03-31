package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.Rates;
import com.realty.agency.domain.RatesId;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class Rates.
 * @see com.realty.agency.domain.Rates
 * @author Hibernate Tools
 */
public class RatesDao {

    private static final Logger log = LoggerFactory.getLogger(RatesDao.class);

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

    public void persist(Rates transientInstance) {
        log.debug("persisting Rates instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(Rates instance) {
        log.debug("attaching dirty Rates instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(Rates instance) {
        log.debug("attaching clean Rates instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(Rates persistentInstance) {
        log.debug("deleting Rates instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public Rates merge(Rates detachedInstance) {
        log.debug("merging Rates instance");
        try {
            Rates result = (Rates) sessionFactory.getCurrentSession().merge(
                    detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public Rates findById(com.realty.agency.domain.RatesId id) {
        log.debug("getting Rates instance with id: " + id);
        try {
            Rates instance = (Rates) sessionFactory.getCurrentSession().get(
                    "com.realty.agency.domain.Rates", id);
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

    public List<Rates> findByExample(Rates instance) {
        log.debug("finding Rates instance by example");
        try {
            List<Rates> results = (List<Rates>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.Rates")
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
