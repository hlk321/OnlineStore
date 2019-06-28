package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
    List<Map<String,Object>> query(String name,String classId,String brandId,Integer page);

    //根据商品编号查询商品
    Map<String,Object> getProduct(String productId);

    //热销查询
    List<Map<String,Object>> hot();
}
