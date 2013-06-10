package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.realty.agency.services.IDeptService;

@Controller
@RequestMapping("/dept")
public class DeptController extends MultiActionController {

    @Autowired
    private IDeptService deptService;

    @RequestMapping("/load")
    public ModelAndView load() {
        ModelAndView mav = new ModelAndView("depts");
        mav.addObject("deptList", this.deptService.loadDepts());
        return mav;
    }
}
