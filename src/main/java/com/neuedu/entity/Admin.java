package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    private Integer id;
    private String aname;
    private  String apwd;
    private  Integer disabled;
    private  Integer grade;
}
