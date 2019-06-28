package com.oaec.b2c.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.service.AddressService;
import com.oaec.b2c.service.CartService;
import com.oaec.b2c.service.OrderService;
import com.oaec.b2c.service.UserService;
import com.oaec.b2c.service.impl.AddressServiceImpl;
import com.oaec.b2c.service.impl.CartServiceImpl;
import com.oaec.b2c.service.impl.OrderServiceImpl;
import com.oaec.b2c.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private AddressService addressService = new AddressServiceImpl();
    private CartService cartService = new CartServiceImpl();
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        String[] productIds = req.getParameterValues("productId");
        List<Map<String, Object>> addressList = addressService.getAddress(userId);
        List<Map<String, Object>> productList = cartService.getProducts4Checkout(userId, productIds);
        Map<String, Object> total = cartService.getTotal(userId, productIds);
        Map<String, Object> users = userService.queryByUserId(userId);
        req.setAttribute("addressList",addressList);
        req.setAttribute("productList",productList);
        req.setAttribute("total",total);
        req.setAttribute("user",users);
        req.getRequestDispatcher("/WEB-INF/views/checkout.jsp").forward(req,resp);
    }
}
