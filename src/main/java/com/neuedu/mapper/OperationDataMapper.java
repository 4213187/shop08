package com.neuedu.mapper;

import com.neuedu.entity.OperationData;

public interface OperationDataMapper {
   void add(OperationData operationData);
   OperationData findByUUID(String uuid);
}
