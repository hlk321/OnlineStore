package com.oaec.b2c.service.impl;

import com.oaec.b2c.dao.CartDao;
import com.oaec.b2c.dao.impl.CartDaoImpl;
import com.oaec.b2c.service.CartService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartServiceImpl implements CartService {

    private CartDao cartDao = new CartDaoImpl();

    @Override
    public List<Map<String, Object>> getCatProduct(Integer userId) {
        return cartDao.queryByUserId(userId);
    }

    @Override
    public Map<String, Object> getPrice(Integer userId) {
        return cartDao.queryPrice(userId);
    }

    @Override
    public boolean addCart(Integer userId, Integer productId, Integer amount) {
        Map<String, Object> cart = cartDao.queryByUserIdAndProductId(userId, productId);
        Map<String,Object> param = new HashMap<>();
        param.put("userId",userId);
        param.put("productId",productId);
        param.put("amount",amount);
        int i = 0;
        if(cart == null){
            //添加
            i = cartDao.doInsert(param);
        }else{
            i = cartDao.updateAmount(param);
        }

        return i == 1;
    }

    @Override
    public boolean delete(Integer userId, Integer productId) {
        return cartDao.doDelete(userId,productId) == 1;
    }

    @Override
    public boolean updateAmount(String action, Integer userId, Integer productId) {
        int i = 0;
        if("add".equals(action)){
            i = cartDao.addAmount(userId,productId);
        }else{
            i = cartDao.subAmount(userId,productId);
        }
        return i == 1;
    }

    @Override
    public Map<String, Object> getTotal(Integer userId, String[] productIds) {
        return cartDao.queryTotal(userId,productIds);
    }

    @Override
    public List<Map<String, Object>> getProducts4Checkout(Integer userId, String[] productIds) {
        return cartDao.queryProduct4Checkout(userId,productIds);
    }
}
