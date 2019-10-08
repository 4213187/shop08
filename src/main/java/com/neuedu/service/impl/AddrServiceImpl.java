package com.neuedu.service.impl;

import com.neuedu.entity.City;
import com.neuedu.entity.Country;
import com.neuedu.entity.Province;
import com.neuedu.mapper.AddrMapper;
import com.neuedu.service.AddrService;

import java.util.List;

public class AddrServiceImpl implements AddrService {
    AddrMapper  addrMapper;
    public AddrServiceImpl(AddrMapper addrMapper){
        this.addrMapper =addrMapper;
    }
    @Override
    public List<Province> findAllProvince() {
        return addrMapper.findAllProvince();
    }

    @Override
    public List<City> findByProvince(String provinceId) {
        return addrMapper.findByProvince(provinceId);
    }

    @Override
    public List<Country> findByCity(String cityId) {
        return addrMapper.findByCity(cityId);
    }
}
