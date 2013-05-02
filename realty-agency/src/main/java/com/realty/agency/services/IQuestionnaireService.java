package com.realty.agency.services;

import java.util.List;

import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Questions;

public interface IQuestionnaireService {
    List<Questions> loadAllQuestions();

    Questions addQuestion(String text, int measureId);

    Questions updateQuestion(int id, String text, int measureId);

    void deleteQuestion(int id);
    
    List<Measures> loadAllMeasures();
}
