package com.oaec.b2c.dao.impl;

import com.oaec.b2c.dao.CategoryDao;
import com.oaec.b2c.util.CommonDao;

import java.util.List;
import java.util.Map;

public class CategoryDaoImpl extends CommonDao implements CategoryDao {

    @Override
    public List<Map<String, Object>> queryNavNv() {
        String sql = "SELECT * FROM class WHERE class_id IN (SELECT class_id FROM product GROUP BY class_id) AND fclass_id = 2000";
        return query4MapList(sql);
    }

    @Override
    public List<Map<String, Object>> queryNavNan() {
        String sql = "SELECT * FROM class WHERE class_id IN (SELECT class_id FROM product GROUP BY class_id) AND fclass_id = 2001";
        return query4MapList(sql);

    }

    @Override
    public Map<String, Object> queryByClassId(Integer classId) {
        String sql = "SELECT * FROM class WHERE class_id = ?";
        return query4Map(sql,classId);
    }



}
