package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.realty.agency.domain.Employees;
import com.realty.agency.services.IEmployeeService;

@Controller
@RequestMapping("/emp")
public class EmployeesController extends MultiActionController {

    @Autowired
    private IEmployeeService employeeService;


    @RequestMapping("/load")
    public ModelAndView load() {
        ModelAndView mav = new ModelAndView("employees");
        mav.addObject("empList", this.employeeService.loadEmployees(new Employees()));
        return mav;
    }
}
