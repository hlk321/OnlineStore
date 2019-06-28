package com.oaec.b2c.service.impl;

import com.oaec.b2c.dao.AddressDao;
import com.oaec.b2c.dao.impl.AddressDaoImpl;
import com.oaec.b2c.service.AddressService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AddressServiceImpl implements AddressService {

    private  AddressDao addressDao = new AddressDaoImpl();

    @Override
    public List<Map<String, Object>> getAddress(Integer userId) {

        return addressDao.queryByUserId(userId);
    }

    @Override
    public Boolean addAddress(String name, String tel, String addressDetail, Integer userId) {
        Map<String,Object> map = new HashMap<>();
        map.put("name",name);
        map.put("tel",tel);
        map.put("addressDetail",addressDetail);
        map.put("userId",userId);
        return addressDao.doInsert(map) == 1;
    }

    @Override
    public Boolean deleteAddress(Integer addressId) {
        return addressDao.doDelete(addressId) == 1;
    }

    @Override
    public Boolean updateAddress(Integer addressId) {
        return addressDao.updateAddress(addressId) == 1;
    }
}
