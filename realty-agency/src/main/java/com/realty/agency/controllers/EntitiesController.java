package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.realty.agency.domain.Entities;
import com.realty.agency.services.IEntityService;

@Controller
@RequestMapping("/ent")
public class EntitiesController extends MultiActionController {

    @Autowired
    private IEntityService entityService;

    @RequestMapping("/load")
    public ModelAndView load(@RequestParam String active) {
        ModelAndView mav = new ModelAndView("entities");
        Entities criteria = new Entities();
        if ("ACTIVE".equals(active)) {
            criteria.setActive((byte) 1);
        } else if ("INACTIVE".equals(active)) {
            criteria.setActive((byte) 0);
        }
        mav.addObject("active", active);
        mav.addObject("entList", this.entityService.loadEntities(criteria));
        mav.addObject("entTypes", this.entityService.loadAllTypes());
        mav.addObject("entClasses", this.entityService.loadAllClasses());
        mav.addObject("acttypeList", this.entityService.loadAllActTypes());
        return mav;
    }

    @RequestMapping("/add")
    public ModelAndView add(@RequestParam String addrCity,
            @RequestParam String addrStreet, @RequestParam String addrHouse,
            @RequestParam String addrAppartment, @RequestParam int classId,
            @RequestParam int typeId, @RequestParam String price) {
        ModelAndView mav = new ModelAndView("entity");

        mav.addObject("ent", this.entityService.createEntity(addrCity,
                addrStreet, addrHouse, addrAppartment, classId, typeId, price));

        return mav;
    }

    @ResponseStatus(value = HttpStatus.OK)
    @RequestMapping("/del")
    public void delete(@RequestParam int id) {
        this.entityService.deleteEntity(id);
    }

    @RequestMapping("/upd")
    public ModelAndView update(@RequestParam int id,
            @RequestParam String addrCity, @RequestParam String addrStreet,
            @RequestParam String addrHouse,
            @RequestParam String addrAppartment, @RequestParam int classId,
            @RequestParam int typeId, @RequestParam String price) {
        ModelAndView mav = new ModelAndView("entity");

        mav.addObject("ent", this.entityService.updateEntity(id, addrCity,
                addrStreet, addrHouse, addrAppartment, classId, typeId, price));

        return mav;
    }

    @RequestMapping("/activate")
    public ModelAndView activate(@RequestParam int id) {
        ModelAndView mav = new ModelAndView("entity");

        mav.addObject("ent", this.entityService.activateEntity(id));

        return mav;
    }
}
