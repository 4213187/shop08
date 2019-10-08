package com.neuedu.service;

import com.neuedu.entity.City;
import com.neuedu.entity.Country;
import com.neuedu.entity.Province;

import java.util.List;

public interface AddrService {
    List<Province> findAllProvince();
    List<City> findByProvince(String provinceId);
    List<Country> findByCity(String cityId);
}
