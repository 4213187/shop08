package com.neuedu.service.impl;

import com.neuedu.entity.OperationData;
import com.neuedu.mapper.OperationDataMapper;
import com.neuedu.service.OperationDataService;
import com.neuedu.util.MyBatisUtil;

public class OperationDataServiceImpl implements OperationDataService {
    OperationDataMapper operationDataMapper;
    public  OperationDataServiceImpl(){

    }
    public  OperationDataServiceImpl(OperationDataMapper operationDataMapper){
         this.operationDataMapper =operationDataMapper;
    }
    @Override
    public void add(OperationData operationData) {
       operationDataMapper.add(operationData);

    }

    @Override
    public OperationData findByUUID(String uuid) {
        return operationDataMapper.findByUUID(uuid);
    }
}
