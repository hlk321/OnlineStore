package com.oaec.b2c.dao;

import java.util.List;
import java.util.Map;

public interface BrandDao {
    //查询所有品牌
    List<Map<String,Object>> queryAllBrand();

    //根据编号查询品牌
    Map<String,Object> queryByBrandId(Integer brandId);
}
