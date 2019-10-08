package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    private Integer id;
    private String name;
    private String descr;
    private Integer pid;
    private Integer leaf;
    private Integer grade;
    private List<Category> children;
}
