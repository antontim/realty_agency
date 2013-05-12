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

import com.realty.agency.services.IActivityService;

@Controller
@RequestMapping("/act")
public class ActivitiesController extends MultiActionController {
    private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); // HH:mm:ss.SSSs
    @Autowired
    private IActivityService activityService;

    @RequestMapping("/load")
    public ModelAndView load(@RequestParam String startDate, @RequestParam String endDate) throws ParseException {
        ModelAndView mav = new ModelAndView("activities");
        mav.addObject("actList",
                this.activityService.loadActivities(df.parse(startDate),df.parse(endDate)));
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView add(@RequestParam int entId, @RequestParam int actTpId) {
        ModelAndView mav = new ModelAndView("activity");

        mav.addObject("act",
                this.activityService.createActivity(entId, actTpId));

        return mav;
    }

    @RequestMapping("/norm/load")
    public ModelAndView loadNorms() {
        ModelAndView mav = new ModelAndView("norms");

        mav.addObject("normList", this.activityService.loadNorms());

        return mav;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping("/norm/upd")
    public void updNorm(@RequestParam int id, @RequestParam float val) {
        this.activityService.updateNorm(id, val);
    }
}
