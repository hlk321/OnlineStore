package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface CartService {

    //查询指定用户的购物车中的商品
    List<Map<String,Object>> getCatProduct(Integer userId);

    //总价
    Map<String,Object> getPrice(Integer userId);

    //添加商品到购物车
    boolean addCart(Integer userId,Integer productId,Integer amount);

    //删除购物车中的商品
    boolean delete(Integer userId,Integer productId);

    //更新购物车中商品数量
    boolean updateAmount(String action,Integer userId,Integer productId);

    //购物车中商品总数量，总价钱
    Map<String,Object> getTotal(Integer userId,String[] productIds);

    List<Map<String,Object>> getProducts4Checkout(Integer userId,String[] productIds);

}
