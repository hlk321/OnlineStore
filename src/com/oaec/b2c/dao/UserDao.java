package com.oaec.b2c.dao;

import java.util.Map;

public interface UserDao {
    /**
     * 根据用户名查找用户Id
     * @param username
     * @return
     */
    Map<String, Object> queryById(String username);

    /**
     * 注册新用户
     * @param userName
     * @param password
     * @param tel
     * @return
     */
    Integer register(String userName,String password,String tel);

    /**
     * 根据用户Id查找用户
     * @param userId
     * @return
     */
    Map<String,Object> queryByUserId(Integer userId);

    Integer doUpdate(Integer userId,Integer money);
}
