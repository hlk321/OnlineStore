package com.oaec.b2c.service.impl;

import com.oaec.b2c.dao.CategoryDao;
import com.oaec.b2c.dao.impl.CategoryDaoImpl;
import com.oaec.b2c.service.NavService;

import java.util.List;
import java.util.Map;

public class NavServiceImpl implements NavService {

    private CategoryDao categoryDao = new CategoryDaoImpl();

    @Override
    public List<Map<String, Object>> getNavNv() {
        return categoryDao.queryNavNv();

    }



    @Override
    public List<Map<String, Object>> getNavNan() {
        return categoryDao.queryNavNan();
    }


}
