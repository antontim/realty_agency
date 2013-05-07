package com.realty.agency.dao.hibernate;

import static org.hibernate.criterion.Example.create;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.expression.spel.ast.Projection;

import com.realty.agency.dao.ITestResultsDao;
import com.realty.agency.domain.Employees;
import com.realty.agency.domain.TestResults;

/**
 * Home object for domain model class TestResults.
 * 
 * @see com.realty.agency.domain.TestResults
 */
public class TestResultsDao extends HibernateDao<TestResults> implements
        ITestResultsDao {
    private static final Logger logger = LoggerFactory
            .getLogger(TestResultsDao.class);

    public TestResultsDao() {
        super.setEntityName("com.realty.agency.domain.TestResults");
    }

    @Override
    public List<TestResults> find(TestResults criteria) {
        logger.debug("finding instance by example");
        try {

            Criteria crit = this.getSession().createCriteria(TestResults.class)
                    .add(create(criteria));
            if (criteria.getId() != null) {
                if (criteria.getId().getEmployeeId() != null)
                    crit.add(Restrictions.eq("id.employeeId", criteria.getId()
                            .getEmployeeId()));
                if (criteria.getId().getTestId() != null)
                    crit.add(Restrictions.eq("id.testId", criteria.getId()
                            .getTestId()));
                if (criteria.getId().getPassed() != null)
                    crit.add(Restrictions.eq("id.passed", criteria.getId()
                            .getPassed()));
            }
            @SuppressWarnings("unchecked")
            List<TestResults> results = crit.list();
            logger.debug("find by example successful, result size: "
                    + results.size());
            return results;
        } catch (RuntimeException re) {
            logger.error("find by example failed", re);
            throw re;
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<TestResults> findByEmpAndDateRange(int empId, Date startDate,
            Date endDate) {
        logger.debug("finding instance by date range");
        List<TestResults> res = new ArrayList<TestResults>();
        try {
            Criteria crit = this.getSession().createCriteria(
                    TestResults.class);
            crit.add(Restrictions.eq("id.employeeId", empId));
            crit.add(Restrictions.between("id.passed", startDate, endDate));
            res = crit.list();
        } catch (RuntimeException re) {
            logger.error("find by date range failed", re);
            throw re;
        }
        return res;
    }
}
