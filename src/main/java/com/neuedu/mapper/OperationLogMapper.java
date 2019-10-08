package com.neuedu.mapper;

import com.neuedu.entity.OperationLog;

import java.util.List;

public interface OperationLogMapper {
    List<OperationLog> findAll();
    void add(OperationLog operationLog);
    OperationLog findByUUID(String uuid);
    void update(OperationLog operationLog);
}
