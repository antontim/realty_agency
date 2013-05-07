package com.realty.agency.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.realty.agency.domain.MeasureImportances;

public class MahService implements IMahService {

    @Autowired
    private IMeasureService measureService;

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
    @Override
    public Map<Integer,Float> calcAvgMeasuresImp() {
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
}

