package com.oaec.b2c.servlet;

import com.oaec.b2c.service.UserService;
import com.oaec.b2c.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_id = Integer.parseInt(user.get("USER_ID").toString());
        Map<String, Object> users = userService.queryByUserId(user_id);
        System.out.println("users = " + users);
        req.setAttribute("user",users);
        req.getRequestDispatcher("/WEB-INF/views/user.jsp").forward(req,resp);
    }
}
