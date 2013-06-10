package com.realty.agency.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.util.CollectionUtils;

import com.realty.agency.dao.IMeasuresDao;
import com.realty.agency.dao.IQuestionsDao;
import com.realty.agency.dao.ITestsDao;
import com.realty.agency.domain.MeasureTarget;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Questions;
import com.realty.agency.domain.Tests;

public class QuestionnaireService implements IQuestionnaireService {

    @Autowired
    private IQuestionsDao questionsDao;
    @Autowired
    private IMeasuresDao measuresDao;
    @Autowired
    private ITestsDao testsDao;

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
    public Questions updateQuestion(int id, String label, String text,
            int measureId) {
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
        return this.measuresDao.findEmpMeasures(new Measures(),false,MeasureTarget.EMPLOYEE);
    }

    @Override
    public List<Tests> loadAllTests() {
        return this.testsDao.find(new Tests());
    }

    @Override
    public Tests addTest(String name, String type, int measureId) {
        Tests test = new Tests(name, type, new Measures(measureId));
        this.testsDao.add(test);
        List<Tests> tests = this.testsDao.find(new Tests(test.getId()));
        return CollectionUtils.isEmpty(tests) ? null : tests.get(0);
    }

    @Override
    public Tests updateTest(int id, String name, String type, int measureId) {
        List<Tests> tests = this.testsDao.find(new Tests(id));
        if (CollectionUtils.isEmpty(tests))
            throw new IncorrectResultSizeDataAccessException(1, 0);
        tests.get(0).setType(type);
        tests.get(0).setMeasures(new Measures(measureId));
        tests.get(0).setName(name);
        this.testsDao.update(tests.get(0));
        tests = this.testsDao.find(new Tests(id));
        return CollectionUtils.isEmpty(tests) ? null : tests.get(0);
    }

    @Override
    public void deleteTest(int id) {
        this.testsDao.delete(new Tests(id));
    }
}
