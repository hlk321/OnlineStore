package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.OrderDao;
import com.oaec.b2c.util.CommonDao;

import java.util.List;
import java.util.Map;

public class OrderDaoImpl extends CommonDao implements OrderDao {
    @Override
    public List<Map<String, Object>> queryByUserId(Integer userId) {
        String sql = "SELECT * FROM ORDERS WHERE USER_ID = ? ORDER BY TIME DESC";
        return query4MapList(sql,userId);
    }

    @Override
    public List<Map<String, Object>> queryProductByOrderId(Integer orderId) {
        String sql = "SELECT ORDERS_DETAILS.ORDERS_ID,ORDERS_DETAILS.URL,ORDERS_DETAILS.PRODUCT_NAME,ORDERS_DETAILS.AMOUNT,ORDERS_DETAILS.PRICE FROM ORDERS,ORDERS_DETAILS WHERE ORDERS.ORDERS_ID = ORDERS_DETAILS.ORDERS_ID AND ORDERS.ORDERS_ID = ?";
        return query4MapList(sql,orderId);
    }

    @Override
    public Double getTotalPrice(Integer orderId) {
        String sql = "SELECT SUM(ORDERS_DETAILS.AMOUNT*ORDERS_DETAILS.PRICE) total_price FROM ORDERS,ORDERS_DETAILS WHERE ORDERS.ORDERS_ID = ORDERS_DETAILS.ORDERS_ID AND ORDERS.ORDERS_ID = ?";
        Map<String, Object> map = query4Map(sql, orderId);
        return Double.parseDouble(map.get("TOTAL_PRICE").toString());
    }

    @Override
    public int doInsert(Integer userId, Integer addressId) {
        String sql = "INSERT INTO ORDERS VALUES (?,?,sysdate,1,?)";
        int orderId = getOrderId();
        int i = executeUpdate(sql,orderId,userId,addressId);
        if(i == 1){
            return orderId;
        }
        return 0;
    }

    @Override
    public int doInsertDetail(Map<String, Object> param) {
        String sql = "INSERT INTO ORDERS_DETAILS VALUES (SEQ_ORDERS_DETAILS.nextval,?,?,?,?,?,?)";
        return executeUpdate(sql,param.get("ORDER_ID"),param.get("PRODUCT_ID"),param.get("PRODUCT_NAME"),param.get("URL"),param.get("PRICE"),param.get("AMOUNT"));
    }

    private int getOrderId(){
        String sql = "SELECT seq_orders.nextval ORDER_ID FROM dual";
        Map<String, Object> map = query4Map(sql);
        return Integer.parseInt(map.get("ORDER_ID").toString());
    }
}
