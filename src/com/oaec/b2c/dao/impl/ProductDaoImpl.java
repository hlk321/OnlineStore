package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.ProductDao;
import com.oaec.b2c.util.CommonDao;

import java.util.List;
import java.util.Map;

public class ProductDaoImpl extends CommonDao implements ProductDao {
    @Override
    public List<Map<String, Object>> queryAll() {
        String sql = "SELECT * FROM product WHERE is_delete = 1 ORDER BY add_time DESC";
        return query4MapList(sql);
    }

    @Override
    public List<Map<String, Object>> queryAll(Integer page) {
        String sql = "SELECT * FROM (SELECT ROWNUM rn,t1.* FROM(SELECT * FROM product WHERE is_delete = 1) t1)t2 WHERE t2.rn > (?- 1) * 4 AND t2.rn <= ? * 4";
        return query4MapList(sql,page,page);
    }

    @Override
    public List<Map<String, Object>> queryHot() {
        String sql = "SELECT ROWNUM,empno.* FROM(SELECT * FROM product Where is_delete = 1 And sale > 0 ORDER BY sale DESC) empno WHERE ROWNUM <= 5";
        return query4MapList(sql);
    }

    @Override
    public List<Map<String, Object>> queryLike(String name) {
        String sql = " SELECT * FROM product WHERE UPPER(product_name) LIKE UPPER(?) AND is_delete = 1";
        return query4MapList(sql,"%"+name+"%");
    }

    @Override
    public List<Map<String, Object>> queryByFClassId(Integer classId) {
        String sql = "SELECT p.*,c.a FROM PRODUCT p, (SELECT c2.CLASS_ID a,c1.CLASS_ID b FROM CLASS c1,CLASS c2 WHERE c2.CLASS_ID = c1.FCLASS_ID) c WHERE p.CLASS_ID = c.b AND c.a = ?";
        return query4MapList(sql,classId);
    }

    @Override
    public List<Map<String, Object>> queryByClassId(Integer classId) {
        String sql = "SELECT * FROM product WHERE class_id = ?";
        return query4MapList(sql,classId);
    }



    @Override
    public List<Map<String, Object>> queryByBrandId(Integer brandId) {
        String sql = "SELECT * FROM product WHERE brand_id = ? AND is_delete = 1";
        return query4MapList(sql,brandId);
    }

    @Override
    public Map<String, Object> queryByProductId(Integer productId) {
        String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_ID = ?";
        return query4Map(sql,productId);
    }

    @Override
    public int updateStockAndSale(Integer productId, Integer amount) {
        String sql = "UPDATE PRODUCT SET STOCK = STOCK - ? ,SALE = SALE + ? WHERE PRODUCT_ID = ?";
        return executeUpdate(sql,amount,amount,productId);
    }


}
