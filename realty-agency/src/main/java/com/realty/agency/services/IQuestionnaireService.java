package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Questions;
import com.realty.agency.domain.Tests;

public interface IQuestionnaireService {
    List<Questions> loadAllQuestions();

    Questions addQuestion(String label, String text, int measureId);

    Questions updateQuestion(int id, String label, String text, int measureId);

    void deleteQuestion(int id);

    List<Measures> loadAllMeasures();

    List<Tests> loadAllTests();

    Tests addTest(String name, String type, int measureId);

    Tests updateTest(int id, String name, String type, int measureId);

    void deleteTest(int id);
}
