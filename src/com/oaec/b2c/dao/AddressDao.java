package com.oaec.b2c.dao;

import java.util.List;
import java.util.Map;

public interface AddressDao {
    //根据地址编号查地址
    Map<String,Object> queryById(Integer addressId);

    //根据用户编号查询地址
    List<Map<String,Object>> queryByUserId(Integer userId);

    //添加收货地址
    Integer doInsert(Map<String,Object> map);

    //删除收货地址
    Integer doDelete(Integer addressId);

    //修改收货地址,将状态改为0
    Integer updateAddress(Integer addressId);
}
