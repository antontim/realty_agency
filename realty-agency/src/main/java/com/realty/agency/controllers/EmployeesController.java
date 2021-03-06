package com.realty.agency.controllers;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.realty.agency.domain.Employees;
import com.realty.agency.services.IEmployeeService;
import com.realty.agency.services.IQuestionnaireService;

@Controller
@RequestMapping("/emp")
public class EmployeesController extends MultiActionController {
    private DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss.SSS
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IQuestionnaireService questionnaireService;

    @RequestMapping("/load")
    public ModelAndView load() {
        ModelAndView mav = new ModelAndView("employees");
        mav.addObject("empList",
                this.employeeService.loadEmployees(new Employees()));
        mav.addObject("posList", this.employeeService.loadAllPositions());
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView add(@RequestParam String name, @RequestParam int pos) {
        ModelAndView mav = new ModelAndView("employee");
        this.employeeService.addEmployee(name, pos);

        mav.addObject("emp", this.employeeService.loadEmployeeByName(name));
        return mav;
    }

    @RequestMapping("/del")
    @ResponseStatus(value = HttpStatus.OK)
    public void delete(@RequestParam int id) {
        this.employeeService.deleteEmployee(id);
    }

    @RequestMapping("/upd")
    public ModelAndView update(@RequestParam int id, @RequestParam String name,
            @RequestParam int pos) {
        ModelAndView mav = new ModelAndView("employee");
        this.employeeService.updateEmployee(id, name, pos);

        mav.addObject("emp", this.employeeService.loadEmployeeById(id));
        return mav;
    }

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping("/eval/del")
    public void deleteEval(@RequestParam int id) {
        this.employeeService.deleteEmpEvaluation(id);
    }

    @RequestMapping("/eval/upd")
    public ModelAndView updateEval(@RequestParam int id,
            @RequestParam float mark) {
        ModelAndView mav = new ModelAndView("eval");

        mav.addObject("eval",
                this.employeeService.updateEmpEvaluation(id, mark));

        return mav;
    }

    @RequestMapping("/eval/add")
    public ModelAndView addEval(@RequestParam int empId,
            @RequestParam int questionId, @RequestParam float mark) {
        ModelAndView mav = new ModelAndView("eval");

        mav.addObject("eval",
                this.employeeService.addEmpEvaluation(empId, questionId, mark));

        return mav;
    }

    @RequestMapping("/eval/load")
    public ModelAndView loadEval(@RequestParam int empId,
            @RequestParam String startDate, @RequestParam String endDate) throws ParseException {
        ModelAndView mav = new ModelAndView("evals");

        mav.addObject("evalList", this.employeeService
                .loadAllEmpEvaluationsByRange(empId, df.parse(startDate), df.parse(endDate)));
        mav.addObject("questList", this.questionnaireService.loadAllQuestions());

        return mav;
    }

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping("/res/del")
    public void deleteTestResult(@RequestParam int empId,
            @RequestParam int testId, @RequestParam String passed) throws ParseException {
        this.employeeService.deleteTestResult(testId, empId, df.parse(passed));
    }

    @RequestMapping("/res/upd")
    public ModelAndView updateTestResult(@RequestParam int empId,
            @RequestParam int testId, @RequestParam String passed,
            @RequestParam float res) throws ParseException {
        ModelAndView mav = new ModelAndView("testresult");

        mav.addObject("testres", this.employeeService.updateTestResult(testId,
                empId, df.parse(passed), res));

        return mav;
    }

    @RequestMapping("/res/add")
    public ModelAndView addTestResult(@RequestParam int empId,
            @RequestParam int testId, @RequestParam float res) {
        ModelAndView mav = new ModelAndView("testresult");

        mav.addObject("testres",
                this.employeeService.addTestResult(testId, empId, res));

        return mav;
    }

    @RequestMapping("/res/load")
    public ModelAndView loadTestResult(@RequestParam int empId,
            @RequestParam String startDate, @RequestParam String endDate)
            throws ParseException {
        ModelAndView mav = new ModelAndView("testresults");

        mav.addObject(
                "testresList",
                this.employeeService.loadAllTestResultsByRange(empId,
                        df.parse(startDate), df.parse(endDate)));
        mav.addObject("testList", this.questionnaireService.loadAllTests());

        return mav;
    }

    @RequestMapping("/rate/load")
    public ModelAndView loadRates(@RequestParam int empId) {
        ModelAndView mav = new ModelAndView("rates");

        mav.addObject("rateList", this.employeeService.loadMeasureRates(empId));

        return mav;
    }
}
