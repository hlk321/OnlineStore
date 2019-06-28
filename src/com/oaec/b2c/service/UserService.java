package com.oaec.b2c.service;

import java.util.Map;

public interface UserService {
    //登录
    Map<String, Object> login(String username, String password);

    //注册
    Map<String,Object> register(String userName, String tel, String password1,String password2);

    //根据Id查询用户
    Map<String,Object> queryByUserId(Integer userId);

    Boolean charge(Integer userId, Integer money);
}
