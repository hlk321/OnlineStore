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
import java.io.PrintWriter;
import java.util.Map;

@WebServlet("/add2cart")
public class Add2CartServlet extends HttpServlet {
    private CartService cartService = new CartServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        Integer productId = Integer.parseInt(req.getParameter("productId"));
        Integer amount = Integer.parseInt(req.getParameter("amount"));
        boolean b = cartService.addCart(userId, productId, amount);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"success\":"+b+"}");
        writer.close();

    }
}
