package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminLog {
    private String aname;
    private String ip;
    private Timestamp loginDate;
}
