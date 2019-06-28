package com.oaec.b2c.test;

import com.oaec.b2c.dao.CategoryDao;
import com.oaec.b2c.dao.ProductDao;
import com.oaec.b2c.dao.impl.CartDaoImpl;
import com.oaec.b2c.dao.impl.CategoryDaoImpl;
import com.oaec.b2c.dao.impl.ProductDaoImpl;
import com.oaec.b2c.service.AddressService;
import com.oaec.b2c.service.OrderService;
import com.oaec.b2c.service.ProductService;
import com.oaec.b2c.service.impl.AddressServiceImpl;
import com.oaec.b2c.service.impl.OrderServiceImpl;
import com.oaec.b2c.service.impl.ProductServiceImpl;

import java.util.List;
import java.util.Map;

public class HelloWorld {
    public static void main(String[] args) {

       /*CartDaoImpl cartDao = new CartDaoImpl();
       Map<String,Object> map = cartDao.queryTotal(4020,new Integer[]{3000,3001});
        System.out.println(map);
*/
        /*OrderService orderService = new OrderServiceImpl();
        boolean submit = orderService.submit(4020, 5000, new String[]{"3007"});
        System.out.println(submit);*/
        AddressService addressService = new AddressServiceImpl();
        Boolean aBoolean = addressService.deleteAddress(5020);
        System.out.println("aBoolean = " + aBoolean);
    }
}
