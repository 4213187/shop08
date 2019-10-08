package com.neuedu.service.impl;

import com.neuedu.entity.OperationLog;
import com.neuedu.mapper.OperationLogMapper;
import com.neuedu.service.OperationLogService;
import com.neuedu.util.MyBatisUtil;

import java.util.List;

public class OperationLogServiceImpl implements OperationLogService {
    OperationLogMapper operationLogMapper;
    public OperationLogServiceImpl(){}
    public OperationLogServiceImpl(OperationLogMapper operationLogMapper){
        this.operationLogMapper =operationLogMapper;
    }

    @Override
    public List<OperationLog> findAll() {
        return operationLogMapper.findAll();
    }

    @Override
    public void add(OperationLog operationLog) {
        operationLogMapper.add(operationLog);

    }

    @Override
    public OperationLog findByUUID(String uuid) {
        return operationLogMapper.findByUUID(uuid);
    }

    @Override
    public void update(OperationLog operationLog) {
        operationLogMapper.update(operationLog);

    }
}
