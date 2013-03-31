package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.EntityPrices;
import com.realty.agency.domain.EntityPricesId;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class EntityPrices.
 * @see com.realty.agency.domain.EntityPrices
 * @author Hibernate Tools
 */
public class EntityPricesDao {

    private static final Logger log = LoggerFactory.getLogger(EntityPricesDao.class);

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

    public void persist(EntityPrices transientInstance) {
        log.debug("persisting EntityPrices instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(EntityPrices instance) {
        log.debug("attaching dirty EntityPrices instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(EntityPrices instance) {
        log.debug("attaching clean EntityPrices instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(EntityPrices persistentInstance) {
        log.debug("deleting EntityPrices instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public EntityPrices merge(EntityPrices detachedInstance) {
        log.debug("merging EntityPrices instance");
        try {
            EntityPrices result = (EntityPrices) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public EntityPrices findById(com.realty.agency.domain.EntityPricesId id) {
        log.debug("getting EntityPrices instance with id: " + id);
        try {
            EntityPrices instance = (EntityPrices) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.EntityPrices", id);
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

    public List<EntityPrices> findByExample(EntityPrices instance) {
        log.debug("finding EntityPrices instance by example");
        try {
            List<EntityPrices> results = (List<EntityPrices>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.EntityPrices")
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
