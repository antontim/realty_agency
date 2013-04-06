package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.domain.EntityTypes;

/**
 * Home object for domain model class EntityTypes.
 * @see com.realty.agency.domain.EntityTypes
 * @author Hibernate Tools
 */
public class EntityTypesDao implements IEntityTypesDao {

    private static final Logger logger = LoggerFactory.getLogger(EntityTypesDao.class);

    @Autowired
    private SessionFactory sessionFactory;

    public void persist(EntityTypes transientInstance) {
        logger.debug("persisting EntityTypes instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            logger.debug("persist successful");
        } catch (RuntimeException re) {
            logger.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(EntityTypes instance) {
        logger.debug("attaching dirty EntityTypes instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(EntityTypes instance) {
        logger.debug("attaching clean EntityTypes instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    public void delete(EntityTypes persistentInstance) {
        logger.debug("deleting EntityTypes instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            logger.debug("delete successful");
        } catch (RuntimeException re) {
            logger.error("delete failed", re);
            throw re;
        }
    }

    public EntityTypes merge(EntityTypes detachedInstance) {
        logger.debug("merging EntityTypes instance");
        try {
            EntityTypes result = (EntityTypes) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            logger.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            logger.error("merge failed", re);
            throw re;
        }
    }

    public EntityTypes findById(java.lang.Integer id) {
        logger.debug("getting EntityTypes instance with id: " + id);
        try {
            EntityTypes instance = (EntityTypes) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.EntityTypes", id);
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

    public List<EntityTypes> findByExample(EntityTypes instance) {
        logger.debug("finding EntityTypes instance by example");
        try {
            List<EntityTypes> results = (List<EntityTypes>) sessionFactory
                    .getCurrentSession().createCriteria("com.realty.agency.domain.EntityTypes")
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
