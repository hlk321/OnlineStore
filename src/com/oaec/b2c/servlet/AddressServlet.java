package com.oaec.b2c.servlet;

import com.oaec.b2c.service.AddressService;
import com.oaec.b2c.service.impl.AddressServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;


@WebServlet("/address")
public class AddressServlet extends HttpServlet {

    private AddressService addressService = new AddressServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        List<Map<String, Object>> address = addressService.getAddress(userId);
        req.setAttribute("address",address);
        System.out.println("address = " + address);
        req.getRequestDispatcher(("/WEB-INF/views/address.jsp")).forward(req,resp);
    }
}
