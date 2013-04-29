package com.realty.agency.dao.hibernate;

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.dao.IDao;
import com.realty.agency.domain.EntityTypes;
import com.realty.agency.domain.IEntity;

public class HibernateDao<T extends IEntity<?>> implements IDao<T> {
    private static final Logger logger = LoggerFactory
            .getLogger(HibernateDao.class);
    private String entityName;

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<T> find(T criteria) {
        logger.debug("finding instance by example");
        try {
            
            Criteria crit = sessionFactory.getCurrentSession()
                    .createCriteria(this.entityName).add(create(criteria));
            if(criteria.getId() != null) {
                crit.add(Restrictions.eq("id", criteria.getId()));
            }

            @SuppressWarnings("unchecked")
            List<T> results = crit.list();
            logger.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            logger.error("find by example failed", re);
            throw re;
        }
    }

    @Override
    public void add(T rec) {
        this.attachDirty(rec);
    }

    @Override
    public void delete(T rec) {
        logger.debug("deleting instance");
        try {
            sessionFactory.getCurrentSession().delete(rec);
            logger.debug("delete successful");
        } catch (RuntimeException re) {
            logger.error("delete failed", re);
            throw re;
        }
    }

    @Override
    public T update(T rec) {
        return this.merge(rec);
    }

    @SuppressWarnings("unused")
    private void persist(T transientInstance) {
        logger.debug("persisting instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            logger.debug("persist successful");
        } catch (RuntimeException re) {
            logger.error("persist failed", re);
            throw re;
        }
    }

    private void attachDirty(T instance) {
        logger.debug("attaching dirty instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    @SuppressWarnings("unused")
    private void attachClean(EntityTypes instance) {
        logger.debug("attaching clean instance");
        try {
            sessionFactory.getCurrentSession()
                    .buildLockRequest(LockOptions.NONE).lock(instance);
            logger.debug("attach successful");
        } catch (RuntimeException re) {
            logger.error("attach failed", re);
            throw re;
        }
    }

    private T merge(T detachedInstance) {
        logger.debug("merging instance");
        try {
            @SuppressWarnings("unchecked")
            T result = (T) sessionFactory.getCurrentSession().merge(
                    detachedInstance);
            logger.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            logger.error("merge failed", re);
            throw re;
        }
    }

    protected void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    protected Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }
}
