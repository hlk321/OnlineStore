package com.oaec.b2c.service.impl;

import com.oaec.b2c.dao.UserDao;
import com.oaec.b2c.dao.impl.UserDaoImpl;
import com.oaec.b2c.service.UserService;

import java.util.HashMap;
import java.util.Map;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();
    @Override
    public Map<String, Object> login(String username,String password) {
        Map<String, Object> map = userDao.queryById(username);
        if (map == null){
            map = new HashMap<>();
            //登录失败，用户不存在
            map.put("error","用户不存在");
            return map;
        }else{
            if (!map.get("PASSWORD").equals(password)){
                map.put("error","密码错误");
                return map;
                //登录失败，密码错误
            }else{
                //登录成功
                return map;
            }
        }
    }

    @Override
    public Map<String, Object> register(String userName, String tel, String password1, String password2) {
        Map<String, Object> map = new HashMap<>();
        if (!password1.equals(password2)){
            map.put("error","注册失败，两次密码不一致");
            return map;
        }
        Integer register = userDao.register(userName, password1, tel);
        System.out.println("register = " + register);
        if (register == 1){
            map.put("succ", "");
            return map;
        }else {
            map.put("error","注册失败，用户已存在");
            return map;
        }
    }

    @Override
    public Map<String, Object> queryByUserId(Integer userId) {
        return userDao.queryByUserId(userId);
    }

    @Override
    public Boolean charge(Integer userId, Integer money) {
        return userDao.doUpdate(userId,money) == 1;
    }
}
