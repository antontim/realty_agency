package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.realty.agency.services.IMeasureService;

@Controller
@RequestMapping("/measure")
public class MeasureController {
    @Autowired
    private IMeasureService measureService;

    @RequestMapping("/imp/load")
    public ModelAndView loadImportances() {
        ModelAndView mav = new ModelAndView("mimportance");

        mav.addObject("mimpList", this.measureService.loadMeasureImportances());
        mav.addObject("mList", this.measureService.loadMeasures());

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
