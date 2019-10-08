package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OperationData {
    private String uuid;
    private Integer adminId;
    private String adminAname;
    private String adminApwd;
    private Integer adminDisabled;
    private Integer adminGrade;
}
