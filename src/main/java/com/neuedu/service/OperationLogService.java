package com.neuedu.service;

import com.neuedu.entity.OperationLog;

import java.util.List;

public interface OperationLogService {
    List<OperationLog> findAll();
    void add(OperationLog operationLog);
    OperationLog findByUUID(String uuid);
    void update(OperationLog operationLog );
}
