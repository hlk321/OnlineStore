package com.oaec.b2c.dao;


import java.util.List;
import java.util.Map;

public interface ProductDao {
    /**
     * 查询全部商品,按上新时间排序
     * @return
     */
    List<Map<String,Object>> queryAll();

    List<Map<String,Object>> queryAll(Integer page);

    /**
     * 热销查询，销量不为0
     * @return
     */
    List<Map<String,Object>> queryHot();

    /*
    模糊查询
     */
    List<Map<String,Object>> queryLike(String name);

    /**
     * 按分类编号查询
     * @param classId
     * @return
     */
    //父分类
    List<Map<String,Object>> queryByFClassId(Integer classId);
    //子分类
    List<Map<String,Object>> queryByClassId(Integer classId);



    //根据品牌编号查询
    List<Map<String,Object>> queryByBrandId(Integer brandId);

    //跟据商品编号查询
    Map<String,Object> queryByProductId(Integer productId);

    //修改商品的库存和销量
    int updateStockAndSale(Integer productId,Integer amount);


}
