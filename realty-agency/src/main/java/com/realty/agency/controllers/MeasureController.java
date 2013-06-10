package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.realty.agency.domain.MeasureTarget;
import com.realty.agency.services.IMeasureService;

@Controller
@RequestMapping("/measure")
public class MeasureController {
    @Autowired
    private IMeasureService measureService;

    @RequestMapping("/imp/load")
    public ModelAndView loadImportances() {
        ModelAndView mav = new ModelAndView("mimportance");

        mav.addObject("mimpList", this.measureService.loadMeasureImportances(MeasureTarget.EMPLOYEE));
        mav.addObject("mList", this.measureService.loadMeasures(MeasureTarget.EMPLOYEE));
        mav.addObject("target", MeasureTarget.EMPLOYEE.getVal());

        return mav;
    }
    
    @RequestMapping("/imp/dept/load")
    public ModelAndView loadDeptImportances() {
        ModelAndView mav = new ModelAndView("mimportance");
        
        mav.addObject("mimpList", this.measureService.loadMeasureImportances(MeasureTarget.DEPT));
        mav.addObject("mList", this.measureService.loadMeasures(MeasureTarget.DEPT));
        mav.addObject("target", MeasureTarget.DEPT.getVal());
        
        return mav;
    }
    
    @RequestMapping("/imp/comp/load")
    public ModelAndView loadCompanyImportances() {
        ModelAndView mav = new ModelAndView("mimportance");
        
        mav.addObject("mimpList", this.measureService.loadMeasureImportances(MeasureTarget.COMPANY));
        mav.addObject("mList", this.measureService.loadMeasures(MeasureTarget.COMPANY));
        mav.addObject("target", MeasureTarget.COMPANY.getVal());
        
        return mav;
    }

    @RequestMapping("/imp/upd")
    public ModelAndView updateImp(@RequestParam int m1, @RequestParam int m2,
            @RequestParam float val) {
        ModelAndView mav = new ModelAndView("mimp");

        mav.addObject("mimp", this.measureService.updateImportance(m1, m2, val));

        return mav;
    }
}
