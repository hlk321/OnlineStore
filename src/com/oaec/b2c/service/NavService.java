package com.oaec.b2c.service;

import java.util.List;
import java.util.Map;

public interface NavService {
    /**
     * 获取分类
     * @return
     */
    List<Map<String,Object>> getNavNv();
    List<Map<String,Object>> getNavNan();


}
