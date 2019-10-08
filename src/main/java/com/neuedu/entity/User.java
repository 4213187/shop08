package com.neuedu.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private  Integer id;
    private  String userName;
    private  String userPassword;
    private  String userPhone;
    private  String userEmail;
    private  Timestamp userRegisterDate;
    private  List<Address> addresses;
    private  Integer disabled;
    private  Integer vip;
    private Timestamp expiryDate;

}
