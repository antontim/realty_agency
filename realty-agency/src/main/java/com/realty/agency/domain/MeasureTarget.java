package com.realty.agency.domain;

public enum MeasureTarget {
    EMPLOYEE(0), DEPT(1), COMPANY(2);
    private int val;
    private MeasureTarget(int val) {
        this.val = val;
    }

    public int getVal() {
        return val;
    }
}