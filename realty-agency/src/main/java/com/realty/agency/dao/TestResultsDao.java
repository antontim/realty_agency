package com.realty.agency.dao;

// Generated Mar 31, 2013 11:42:31 PM by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.realty.agency.domain.TestResults;
import com.realty.agency.domain.TestResultsId;

import static org.hibernate.criterion.Example.create;

/**
 * Home object for domain model class TestResults.
 * @see com.realty.agency.domain.TestResults
 * @author Hibernate Tools
 */
public class TestResultsDao {

    private static final Logger log = LoggerFactory.getLogger(TestResultsDao.class);

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

    public void persist(TestResults transientInstance) {
        log.debug("persisting TestResults instance");
        try {
            sessionFactory.getCurrentSession().persist(transientInstance);
            log.debug("persist successful");
        } catch (RuntimeException re) {
            log.error("persist failed", re);
            throw re;
        }
    }

    public void attachDirty(TestResults instance) {
        log.debug("attaching dirty TestResults instance");
        try {
            sessionFactory.getCurrentSession().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void attachClean(TestResults instance) {
        log.debug("attaching clean TestResults instance");
        try {
            sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

    public void delete(TestResults persistentInstance) {
        log.debug("deleting TestResults instance");
        try {
            sessionFactory.getCurrentSession().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }

    public TestResults merge(TestResults detachedInstance) {
        log.debug("merging TestResults instance");
        try {
            TestResults result = (TestResults) sessionFactory
                    .getCurrentSession().merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public TestResults findById(com.realty.agency.domain.TestResultsId id) {
        log.debug("getting TestResults instance with id: " + id);
        try {
            TestResults instance = (TestResults) sessionFactory
                    .getCurrentSession().get(
                            "com.realty.agency.domain.TestResults", id);
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

    public List<TestResults> findByExample(TestResults instance) {
        log.debug("finding TestResults instance by example");
        try {
            List<TestResults> results = (List<TestResults>) sessionFactory
                    .getCurrentSession()
                    .createCriteria("com.realty.agency.domain.TestResults")
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
