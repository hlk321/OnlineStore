package com.oaec.b2c.servlet;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.service.UserService;
import com.oaec.b2c.service.impl.UserServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        String userName = req.getParameter("userName");
        String tel = req.getParameter("tel");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");
        HttpSession session = req.getSession();
        Map<String, Object> register = userService.register(userName, tel, password1,password2);
        if (register.containsKey("succ")){
            register.put("result",true);
        }else {
            register.put("result",false);
        }
        String s = JSON.toJSONString(register);
        writer.println(s);
        writer.close();

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req,resp);
    }
}
