package com.oaec.b2c.servlet;

import com.oaec.b2c.service.CartService;
import com.oaec.b2c.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private CartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("USER_ID").toString());
        List<Map<String, Object>> products = cartService.getCatProduct(user_id);
        System.out.println("products = " + products);
        Map<String, Object> price = cartService.getPrice(user_id);
        req.setAttribute("products",products);
        req.setAttribute("price",price);
        req.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(req,resp);
    }
}
