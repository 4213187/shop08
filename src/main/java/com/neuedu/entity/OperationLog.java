package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OperationLog {
    private String operator;
    private String object;
    private String type;
    private String content;
    private Timestamp operationDate;
    private  String ip;
    private  Integer status;
    private  String uuid;

}
