package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.dao.IQuestionsDao;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Questions;

public class QuestionnaireService implements IQuestionnaireService {

    @Autowired
    private IQuestionsDao questionsDao;
    @Autowired
    private IMeasuresDao measuresDao;

    @Override
    public List<Questions> loadAllQuestions() {
        return this.questionsDao.find(new Questions());
    }

    @Override
    public Questions addQuestion(String label, String text, int measureId) {
        Questions quest = new Questions(new Measures(measureId), text, label);
        this.questionsDao.add(quest);
        List<Questions> quests = this.questionsDao.find(new Questions(quest
                .getId()));
        return CollectionUtils.isEmpty(quests) ? null : quests.get(0);
    }

    @Override
    public Questions updateQuestion(int id, String label, String text, int measureId) {
        Questions quest = new Questions(new Measures(measureId), text, label);
        quest.setId(id);
        this.questionsDao.update(quest);
        List<Questions> quests = this.questionsDao.find(new Questions(id));
        return CollectionUtils.isEmpty(quests) ? null : quests.get(0);
    }

    @Override
    public void deleteQuestion(int id) {
        this.questionsDao.delete(new Questions(id));
    }
    
    @Override
    public List<Measures> loadAllMeasures() {
        return this.measuresDao.find(new Measures());
    }
}
