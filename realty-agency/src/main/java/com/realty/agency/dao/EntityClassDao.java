package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.EntityClass;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class EntityClass.
 * @see com.realty.agency.domain.EntityClass
 * @author Hibernate Tools
 */
public class EntityClassDao {

    private static final Logger log = LoggerFactory.getLogger(EntityClassDao.class);

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

    public void persist(EntityClass transientInstance) {
        log.debug("persisting EntityClass instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(EntityClass instance) {
        log.debug("attaching dirty EntityClass instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(EntityClass instance) {
        log.debug("attaching clean EntityClass instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(EntityClass persistentInstance) {
        log.debug("deleting EntityClass instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public EntityClass merge(EntityClass detachedInstance) {
        log.debug("merging EntityClass instance");
        try {
            EntityClass result = (EntityClass) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public EntityClass findById(java.lang.Integer id) {
        log.debug("getting EntityClass instance with id: " + id);
        try {
            EntityClass instance = (EntityClass) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.EntityClass", id);
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

    public List<EntityClass> findByExample(EntityClass instance) {
        log.debug("finding EntityClass instance by example");
        try {
            List<EntityClass> results = (List<EntityClass>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.EntityClass")
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
