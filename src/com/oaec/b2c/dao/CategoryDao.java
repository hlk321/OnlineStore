package com.oaec.b2c.dao;


import java.util.List;
import java.util.Map;

public interface CategoryDao {
    //女
    List<Map<String, Object>> queryNavNv();
    //男
    List<Map<String, Object>> queryNavNan();

    //根据分类编号查询
    Map<String,Object> queryByClassId(Integer classId);

}


