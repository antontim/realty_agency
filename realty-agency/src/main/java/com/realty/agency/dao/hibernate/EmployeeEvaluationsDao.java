package com.realty.agency.dao.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.realty.agency.dao.IEmployeeEvaluationsDao;
import com.realty.agency.domain.EmployeeEvaluations;

/**
 * Home object for domain model class EmployeeEvaluations.
 * 
 * @see com.realty.agency.domain.EmployeeEvaluations
 */
public class EmployeeEvaluationsDao extends HibernateDao<EmployeeEvaluations>
        implements IEmployeeEvaluationsDao {
    private static final Logger logger = LoggerFactory
            .getLogger(EmployeeEvaluationsDao.class);

    public EmployeeEvaluationsDao() {
        super.setEntityName("com.realty.agency.domain.EmployeeEvaluations");
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<EmployeeEvaluations> findByRange(int id, Date startDate,
            Date endDate) {
        logger.debug("finding instance by date range");
        List<EmployeeEvaluations> res = new ArrayList<EmployeeEvaluations>();
        try {
            Criteria crit = this.getSession().createCriteria(
                    EmployeeEvaluations.class);
            crit.add(Restrictions.eq("employees.id", id));
            crit.add(Restrictions.between("created", startDate, endDate));
            res = crit.list();
        } catch (RuntimeException re) {
            logger.error("find by date range failed", re);
            throw re;
        }
        return res;
    }
}
