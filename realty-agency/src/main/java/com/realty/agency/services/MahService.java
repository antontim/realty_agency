package com.realty.agency.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.domain.MeasureImportances;
import com.realty.agency.domain.Measures;
import com.realty.agency.domain.Rates;

public class MahService implements IMahService {

    @Autowired
    private IMeasureService measureService;
    @Autowired
    private IEmployeeService employeeService;

    private float calcColSum(Map<Integer,Map<Integer,Float>> values, Integer col) {
        float res = 0f;

        for (Map.Entry<Integer, Map<Integer, Float>> each : values.entrySet()) {
            res += each.getValue().get(col);
        }
        return res;
    }

    private float calcRowSum(Map<Integer,Map<Integer,Float>> values, Integer row) {
        float res = 0f;
        for (Map.Entry<Integer, Float> each : values.get(row).entrySet()) {
            res += each.getValue();
        }
        return res;
    }

    private Map<Integer,Float> normalize(Map<Integer,Map<Integer,Float>> values) {
        float[] colSum = new float[values.size()];
        int col = 0;
        int row = 0;
        for(Map.Entry<Integer, Map<Integer, Float>> each : values.entrySet()) {
            for(Map.Entry<Integer, Float> secEach : each.getValue().entrySet()) {
                if(row == 0) {
                    colSum[col] = this.calcColSum(values, secEach.getKey());
                }
                secEach.setValue(secEach.getValue()/colSum[col]);
                col++;
            }
            row++;
            col = 0;
        }
        return this.normalizeSecondStep(values);
    }

    private Map<Integer,Float> normalizeSecondStep(Map<Integer,Map<Integer,Float>> values) {
        Map<Integer,Float> res = new HashMap<Integer,Float>();
        for(Map.Entry<Integer, Map<Integer, Float>> each : values.entrySet()) {
            res.put(each.getKey(), this.calcRowSum(values, each.getKey())/values.size());
        }
        return res;
    }

    @SuppressWarnings("serial")
    private Map<Integer,Float> calcAvgMeasuresImp() {
        Map<Integer, Map<Integer,Float>> mimpMatrix = new HashMap<Integer, Map<Integer,Float>>();
        
        final List<MeasureImportances> mimpList = this.measureService.loadMeasureImportances();
        for(int i = 0; i < mimpList.size(); i++) {
            final int j = i;
            if(mimpMatrix.get(mimpList.get(i).getId().getMeasure1Id()) == null) {
                mimpMatrix.put(mimpList.get(i).getId().getMeasure1Id(),
                        new HashMap<Integer, Float>(){
                        {
                            this.put(mimpList.get(j).getId().getMeasure2Id(), mimpList.get(j).getImportance());
                        }
                    });
            } else {
                mimpMatrix.get(mimpList.get(i).getId().getMeasure1Id())
                    .put(
                            mimpList.get(i).getId().getMeasure2Id(),
                            mimpList.get(j).getImportance()
                        );
            }
        }
        return this.normalize(mimpMatrix);
    }
    
    // Map<Measure_id, <Map<Employee_id, measure_val>>
    private Map<Integer, Map<Integer, Float>> calcEmpMeasures() {
        Map<Integer, Map<Integer, Float>> res = new HashMap<Integer, Map<Integer,Float>>();
        List<Measures> measures = this.measureService.loadMeasures();
        List<Rates> rates = this.employeeService.calculateMonthEmpRates();
        for(int i = 0; i < measures.size(); i++) {
            res.put(measures.get(i).getId(), this.calcMeasureRate(measures.get(i).getId(),rates));
        }
        return res;
    }
    
    private Map<Integer, Float> calcMeasureRate(Integer measureId, List<Rates> rates) {
        Map<Integer, Float> res = new HashMap<Integer, Float>();
        Map<Integer,Float> measureRates = new HashMap<Integer, Float>();
        for(int i = 0; i < rates.size(); i++) {
            if(!res.isEmpty() && !measureId.equals(rates.get(i).getId().getMeasureId()))
                break;
            if(measureId.equals(rates.get(i).getId().getMeasureId())) {
                measureRates.put(rates.get(i).getId().getEmployeeId(), rates.get(i).getValue());
            }
        }
        return this.normalize(this.formEmpRatesMatrix(measureRates));
    }
    
    @SuppressWarnings("serial")
    private Map<Integer, Map<Integer, Float>> formEmpRatesMatrix(final Map<Integer,Float> measureRates) {
        Map<Integer, Map<Integer, Float>> res = new HashMap<Integer, Map<Integer,Float>>();
        for(final Map.Entry<Integer, Float> each : measureRates.entrySet()) {
            if(res.get(each.getKey()) == null) {
                res.put(each.getKey(), new HashMap<Integer, Float>() {
                    {
                        for(Map.Entry<Integer, Float> secEach : measureRates.entrySet()) {
                            put(secEach.getKey(), each.getValue()/secEach.getValue());
                        }
                    }
                });
            } else {
                for(Map.Entry<Integer, Float> secEach : measureRates.entrySet()) {
                    res.get(each.getKey()).put(secEach.getKey(), each.getValue()/secEach.getValue());
                }
            }
        }
        return res;
    }
    
    @Override
    public Map<Integer, Float> calcMahResults() {
        Map<Integer, Float> res = new HashMap<Integer, Float>();
        
        // Measure_id, Value
        Map<Integer,Float> normMeasures = this.calcAvgMeasuresImp();
        // Measure_id, Map<Employee_id, value>
        Map<Integer, Map<Integer, Float>> normEmpMeasures = this.calcEmpMeasures();
        for(Map.Entry<Integer, Map<Integer, Float>> each : normEmpMeasures.entrySet()) {
            for(Map.Entry<Integer, Float> secEach : each.getValue().entrySet()) {
                if(res.get(secEach.getKey()) == null) {
                    res.put(secEach.getKey(),secEach.getValue() * normMeasures.get(each.getKey()));
                } else {
                    res.put(secEach.getKey(),res.get(secEach.getKey()) + secEach.getValue() * normMeasures.get(each.getKey()));
                }
            }
        }
        return res;
    }
}

