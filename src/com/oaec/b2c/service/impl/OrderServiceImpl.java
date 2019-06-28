package com.oaec.b2c.service.impl;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.dao.AddressDao;
import com.oaec.b2c.dao.CartDao;
import com.oaec.b2c.dao.OrderDao;
import com.oaec.b2c.dao.ProductDao;
import com.oaec.b2c.dao.impl.AddressDaoImpl;
import com.oaec.b2c.dao.impl.CartDaoImpl;
import com.oaec.b2c.dao.impl.OrderDaoImpl;
import com.oaec.b2c.dao.impl.ProductDaoImpl;
import com.oaec.b2c.service.OrderService;

import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();
    private AddressDao addressDao = new AddressDaoImpl();
    private CartDao cartDao = new CartDaoImpl();
    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public List<Map<String, Object>> getOrders(Integer userId) {

        List<Map<String, Object>> orderList = orderDao.queryByUserId(userId);
        for (Map<String, Object> map : orderList) {
            int address_id = Integer.parseInt(map.get("ADDRESS_ID").toString());
            Map<String, Object> address = addressDao.queryById(address_id);
            map.put("address",address);
            int orders_id = Integer.parseInt(map.get("ORDERS_ID").toString());
            Double totalPrice = orderDao.getTotalPrice(orders_id);
            map.put("totalPrice",totalPrice);
            List<Map<String, Object>> products = orderDao.queryProductByOrderId(orders_id);
            map.put("products",products);
        }
        return orderList;
    }

    @Override
    public boolean submit(Integer userId,Integer addressId, String[] productIds) {
        int result = 0;
        //向订单主表插入数据
        int orderId = orderDao.doInsert(userId, addressId);
        for (String productId:productIds) {
            Integer productId1 = Integer.parseInt(productId);
            System.out.println("productId1 = " + productId1);
            Map<String, Object> product = cartDao.queryByUserIdAndProductId(userId, productId1);
            System.out.println("product = " + product);
            product.put("ORDER_ID",orderId);
            //向订单明细表插入数据
            result += orderDao.doInsertDetail(product);
            //在购物车中删除商品
            result += cartDao.doDelete(userId,productId1);
            //修改库存和销量
            int amount = Integer.parseInt(product.get("AMOUNT").toString());
            result += productDao.updateStockAndSale(productId1,amount);
        }
        return result > 0 ;
    }
}
