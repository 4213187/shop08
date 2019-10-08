package com.neuedu.mapper;

import com.neuedu.entity.City;
import com.neuedu.entity.Country;
import com.neuedu.entity.Province;

import java.util.List;

public interface AddrMapper {
    List<Province> findAllProvince();
    List<City> findByProvince(String provinceId);
    List<Country> findByCity(String cityId);
}
