package com.oaec.b2c.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.service.OrderService;
import com.oaec.b2c.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        List<Map<String, Object>> orderList = orderService.getOrders(userId);
        req.setAttribute("orderList",orderList);
        req.getRequestDispatcher("/WEB-INF/views/order.jsp").forward(req,resp);
    }
}
