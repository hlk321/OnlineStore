package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.UserDao;
import com.oaec.b2c.util.CommonDao;

import java.util.Map;

public class UserDaoImpl extends CommonDao implements UserDao {
    @Override
    public Map<String, Object> queryById(String username) {
        String sql = "SELECT * FROM USERS WHERE USER_NAME = ?";
        return query4Map(sql, username);
    }

    @Override
    public Integer register(String userName, String password, String tel) {
        String sql = "INSERT INTO users VALUES (seq_users.nextval,?,?,?,1,sysdate,null,0)";
        return executeUpdate(sql,userName,password,tel);
    }

    @Override
    public Map<String, Object> queryByUserId(Integer userId) {
        String sql = "SELECT * FROM USERS WHERE IS_DELETE = 1 AND USER_ID = ?";
        return query4Map(sql,userId);
    }

    @Override
    public Integer doUpdate(Integer userId, Integer money) {
        String sql = "UPDATE USERS SET USERS.MONEY = USERS.MONEY + ? WHERE USER_ID = ?";
        return executeUpdate(sql,money,userId);
    }

}
