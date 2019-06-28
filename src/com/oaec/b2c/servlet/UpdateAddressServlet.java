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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/updateAddress")
public class UpdateAddressServlet extends HttpServlet {

    private AddressService addressService = new AddressServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //将地址状态改为0
        Boolean result = addressService.updateAddress(Integer.parseInt(req.getParameter("addressId")));
        //添加一条新的地址
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        String name = req.getParameter("name");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");
        Boolean aBoolean = addressService.addAddress(name, tel, address, userId);

        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"result\":"+aBoolean+"}");
        writer.close();
    }
}
