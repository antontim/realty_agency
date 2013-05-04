package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.realty.agency.services.IQuestionnaireService;

@Controller
@RequestMapping("/quest")
public class QuestionnaireController extends MultiActionController {

    @Autowired
    private IQuestionnaireService questionnaireService;

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping("/del")
    public void delete(@RequestParam int id) {
        this.questionnaireService.deleteQuestion(id);
    }

    @RequestMapping("/load")
    public ModelAndView load() {
        ModelAndView mav = new ModelAndView("quests");
        mav.addObject("questList", this.questionnaireService.loadAllQuestions());
        mav.addObject("measureList",
                this.questionnaireService.loadAllMeasures());
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView add(@RequestParam String label,
            @RequestParam String text, @RequestParam int measureId) {
        ModelAndView mav = new ModelAndView("quest");

        mav.addObject("quest",
                this.questionnaireService.addQuestion(label, text, measureId));

        return mav;
    }

    @RequestMapping("/upd")
    public ModelAndView update(@RequestParam int id,
            @RequestParam String label, @RequestParam String text,
            @RequestParam int measureId) {
        ModelAndView mav = new ModelAndView("quest");

        mav.addObject("quest", this.questionnaireService.updateQuestion(id,
                label, text, measureId));

        return mav;
    }

    @ResponseStatus(value=HttpStatus.OK)
    @RequestMapping("/test/del")
    public void deletTest(@RequestParam int id) {
        this.questionnaireService.deleteTest(id);
    }

    @RequestMapping("/test/load")
    public ModelAndView loadTests() {
        ModelAndView mav = new ModelAndView("tests");
        mav.addObject("testList", this.questionnaireService.loadAllTests());
        mav.addObject("measureList",
                this.questionnaireService.loadAllMeasures());
        return mav;
    }

    @RequestMapping("/test/add")
    public ModelAndView addTest(@RequestParam String name,
            @RequestParam String type, @RequestParam int measureId) {
        ModelAndView mav = new ModelAndView("test");

        mav.addObject("test",
                this.questionnaireService.addTest(name, type, measureId));

        return mav;
    }

    @RequestMapping("/test/upd")
    public ModelAndView updateTest(@RequestParam int id,
            @RequestParam String name, @RequestParam String type,
            @RequestParam int measureId) {
        ModelAndView mav = new ModelAndView("test");

        mav.addObject("test", this.questionnaireService.updateTest(id, name, type, measureId));

        return mav;
    }

}
