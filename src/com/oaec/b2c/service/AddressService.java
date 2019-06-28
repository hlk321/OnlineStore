package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface AddressService {

    List<Map<String,Object>> getAddress(Integer userId);

    //添加
    Boolean addAddress(String name,String tel,String addressDetail,Integer userId);

    //删除
    Boolean deleteAddress(Integer addressId);

    //修改状态
    Boolean updateAddress(Integer addressId);
}
