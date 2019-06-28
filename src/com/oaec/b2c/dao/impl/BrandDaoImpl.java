package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.BrandDao;
import com.oaec.b2c.util.CommonDao;

import java.util.List;
import java.util.Map;

public class BrandDaoImpl extends CommonDao implements BrandDao {
    @Override
    public List<Map<String, Object>> queryAllBrand() {
        String sql = "SELECT * FROM brand WHERE IS_DELETE= 1";
        return query4MapList(sql);
    }

    @Override
    public Map<String, Object> queryByBrandId(Integer brandId) {
        String sql = "SELECT * FROM brand WHERE brand_id = ?";
        return query4Map(sql,brandId);
    }
}
