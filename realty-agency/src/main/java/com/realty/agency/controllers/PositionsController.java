package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.realty.agency.services.IEmployeeService;

@Controller
@RequestMapping("/pos")
public class PositionsController {
    @Autowired
    private IEmployeeService employeeService;
    
    @RequestMapping("/load")
    public ModelAndView load() {
        ModelAndView mav = new ModelAndView();
        
        mav.addObject("posList", this.employeeService.loadAllPositions());
        
        return mav;
    }
}
