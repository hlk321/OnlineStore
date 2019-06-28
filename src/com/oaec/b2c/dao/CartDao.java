package com.oaec.b2c.dao;

import java.util.List;
import java.util.Map;

public interface CartDao {

    /**
     * 根据用户ID查询购物车
     * @param userId
     * @return
     */
    List<Map<String,Object>> queryByUserId(Integer userId);

    /**
     * 总价格
     * @param userId
     * @return
     */
    Map<String,Object> queryPrice(Integer userId);

    /**
     * 添加商品到购物车
     * @param param：执行insert需要的参数
     * @return
     */
    int doInsert(Map<String,Object> param);

    /**
     * 查询购物车中有无记录
     * @param userId
     * @param productId
     * @return
     */
    Map<String,Object> queryByUserIdAndProductId(Integer userId,Integer productId);

    /**
     * 更新购物车中的数量
     * @param param
     * @return
     */
    int updateAmount(Map<String,Object> param);

    /**
     * 删除购物车中的商品
     * @param userId
     * @param productId
     * @return
     */
    int doDelete(Integer userId,Integer productId);

    /**
     * 加号
     * @param userId
     * @param productId
     * @return
     */
    int addAmount(Integer userId,Integer productId);

    /**
     * 减号
     * @param userId
     * @param productId
     * @return
     */
    int subAmount(Integer userId,Integer productId);

    /**
     * 购物车统计要购买的总数量，总价钱
     * @param userId
     * @param productIds
     * @return
     */
    Map<String,Object> queryTotal(Integer userId,String[] productIds);

    List<Map<String,Object>> queryProduct4Checkout(Integer userId,String[] productIds);

}
