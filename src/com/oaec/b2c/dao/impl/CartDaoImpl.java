package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.CartDao;
import com.oaec.b2c.util.CommonDao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class CartDaoImpl extends CommonDao implements CartDao {
    @Override
    public List<Map<String, Object>> queryByUserId(Integer userId) {
        String sql = "SELECT PRODUCT.STOCK,PRODUCT.PRODUCT_ID,PRODUCT.URL,PRODUCT.PRODUCT_NAME,PRODUCT.PRICE,CART.AMOUNT FROM CART,PRODUCT WHERE CART.PRODUCT_ID = PRODUCT.PRODUCT_ID AND USER_ID = ?";
        return query4MapList(sql,userId);
    }

    @Override
    public Map<String, Object> queryPrice(Integer userId) {
        String sql = "SELECT SUM(PRICE * AMOUNT) price from (SELECT PRODUCT.PRODUCT_ID,PRODUCT.PRICE,CART.AMOUNT FROM CART,PRODUCT WHERE CART.PRODUCT_ID = PRODUCT.PRODUCT_ID AND USER_ID = ?)";
        return query4Map(sql,userId);
    }

    @Override
    public int doInsert(Map<String, Object> param) {
        String sql = "INSERT INTO CART VALUES (SEQ_CART.nextval,?,?,?)";
        return executeUpdate(sql,param.get("userId"),param.get("productId"),param.get("amount"));
    }

    @Override
    public Map<String, Object> queryByUserIdAndProductId(Integer userId, Integer productId) {
        String sql = "SELECT * FROM CART,PRODUCT WHERE CART.PRODUCT_ID = PRODUCT.PRODUCT_ID AND USER_ID = ? AND CART.PRODUCT_ID = ?";
        return query4Map(sql,userId,productId);
    }

    @Override
    public int updateAmount(Map<String, Object> param) {
        String sql = "UPDATE CART SET AMOUNT = AMOUNT + ? WHERE USER_ID = ? AND PRODUCT_ID = ?";
        return executeUpdate(sql,param.get("amount"),param.get("userId"),param.get("productId"));
    }

    @Override
    public int doDelete(Integer userId, Integer productId) {
        String sql = "DELETE FROM CART WHERE USER_ID = ? AND PRODUCT_ID = ?";
        return executeUpdate(sql,userId,productId);
    }

    @Override
    public int addAmount(Integer userId, Integer productId) {
        String sql = "UPDATE CART SET AMOUNT = AMOUNT + 1 WHERE USER_ID = ? AND PRODUCT_ID = ?";
        return executeUpdate(sql,userId,productId);
    }

    @Override
    public int subAmount(Integer userId, Integer productId) {
        String sql = "UPDATE CART SET AMOUNT = AMOUNT - 1 WHERE USER_ID = ? AND PRODUCT_ID = ? AND AMOUNT > 1";
        return executeUpdate(sql,userId,productId);
    }

    @Override
    public Map<String, Object> queryTotal(Integer userId, String[] productIds) {
        StringBuilder sql = new StringBuilder("SELECT SUM(AMOUNT) total_amount,SUM(AMOUNT*PRICE) total_price FROM CART,PRODUCT WHERE PRODUCT.PRODUCT_ID = CART.PRODUCT_ID AND USER_ID = ? AND CART.PRODUCT_ID IN(");
        Object[] param = new Object[productIds.length+1];
        param[0] = userId;
        for (int i = 0;i<productIds.length;i++) {
            sql.append("?,");
            param[i+1] = productIds[i];
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(")");
        return query4Map(sql.toString(),param);
    }

    @Override
    public List<Map<String, Object>> queryProduct4Checkout(Integer userId, String[] productIds) {
        StringBuilder sql = new StringBuilder("SELECT PRODUCT.URL,PRODUCT.PRODUCT_NAME,PRODUCT.PRICE,CART.AMOUNT,PRODUCT.PRODUCT_ID FROM CART,PRODUCT WHERE CART.PRODUCT_ID = PRODUCT.PRODUCT_ID AND USER_ID = ? AND CART.PRODUCT_ID IN(");
        Object[] param = new Object[productIds.length+1];
        param[0] = userId;
        for (int i = 0;i<productIds.length;i++) {
            sql.append("?,");
            param[i+1] = productIds[i];
        }
        sql.deleteCharAt(sql.length()-1);
        sql.append(")");
        return query4MapList(sql.toString(),param);
    }

}
