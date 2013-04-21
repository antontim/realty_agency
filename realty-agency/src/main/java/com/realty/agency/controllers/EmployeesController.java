package com.realty.agency.controllers;

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

@Controller
@RequestMapping("/emp")
public class EmployeesController extends MultiActionController {

    @Autowired
    private IEmployeeService employeeService;

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
    public ModelAndView delete(@RequestParam int id, @RequestParam String name,
            @RequestParam int pos) {
        ModelAndView mav = new ModelAndView("employee");
        this.employeeService.updateEmployee(id, name, pos);

        mav.addObject("emp", this.employeeService.loadEmployeeById(id));
        return mav;
    }
}
