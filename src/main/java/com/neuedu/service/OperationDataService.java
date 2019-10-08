package com.neuedu.service;

import com.neuedu.entity.OperationData;

public interface OperationDataService {
    void add(OperationData operationData);
    OperationData findByUUID(String uuid);
}
