package com.realty.agency.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.realty.agency.services.ICompanyService;
import com.realty.agency.services.IDeptService;
import com.realty.agency.services.IEmployeeService;

@Controller
@RequestMapping("/mah")
public class MahController {
    private static Boolean isInProgress = false;
    @Autowired
    private IEmployeeService employeeService;
    @Autowired
    private IDeptService deptService;
    @Autowired
    private ICompanyService companyService;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping("/calc")
    public void calc() {
        if(isInProgress)
            throw new IllegalAccessError("MAH result is currently calculating.");
        isInProgress = true;
        try {
            this.employeeService.updateEmployeeMah();
            this.deptService.updateDeptMah();
            this.companyService.calcMah();
        }
        finally {
            isInProgress = false;
        }
    }
}
