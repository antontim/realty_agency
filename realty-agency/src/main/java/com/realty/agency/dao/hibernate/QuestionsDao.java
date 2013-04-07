package com.realty.agency.dao.hibernate;

import com.realty.agency.dao.IQuestionsDao;
import com.realty.agency.domain.Questions;

/**
 * Home object for domain model class Questions.
 * 
 * @see com.realty.agency.domain.Questions
 */
public class QuestionsDao extends HibernateDao<Questions> implements
        IQuestionsDao {

    public QuestionsDao() {
        super.setEntityName("com.realty.agency.domain.Questions");
    }
}
