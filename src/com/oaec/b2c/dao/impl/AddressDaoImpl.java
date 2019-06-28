package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.AddressDao;
import com.oaec.b2c.util.CommonDao;

import java.util.List;
import java.util.Map;

public class AddressDaoImpl extends CommonDao implements AddressDao {
    @Override
    public Map<String, Object> queryById(Integer addressId) {
        String sql = "SELECT * FROM ADDRESS WHERE ADDRESS_ID = ?";
        return query4Map(sql,addressId);
    }

    @Override
    public List<Map<String, Object>> queryByUserId(Integer userId) {
        String sql = "SELECT * FROM ADDRESS WHERE IS_DELETE = 1 AND USER_ID = ? ORDER BY IS_DEFAULT DESC ";
        return query4MapList(sql,userId);
    }

    @Override
    public Integer doInsert(Map<String, Object> map) {
        String sql = "INSERT INTO ADDRESS(ADDRESS_ID, NAME, TEL, ADDRESS_DETAIL, USER_ID, IS_DEFAULT, IS_DELETE)VALUES(SEQ_ADDRESS.nextval,?,?,?,?,0,1)";
        return executeUpdate(sql,map.get("name"),map.get("tel"),map.get("addressDetail"),map.get("userId"));
    }

    @Override
    public Integer doDelete(Integer addressId) {
        String sql = "DELETE FROM ADDRESS WHERE ADDRESS_ID = ?";
        return executeUpdate(sql,addressId);

    }

    @Override
    public Integer updateAddress(Integer addressId) {
        String sql = "UPDATE ADDRESS SET IS_DELETE = 0 WHERE ADDRESS_ID = ?";
        return executeUpdate(sql,addressId);
    }


}
