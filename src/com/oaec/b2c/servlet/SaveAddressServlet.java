package com.oaec.b2c.servlet;

import com.alibaba.fastjson.JSON;
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

@WebServlet("/saveAddress")
public class SaveAddressServlet extends HttpServlet {
    private AddressService addressService = new AddressServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Map<String,Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId = Integer.parseInt(user.get("USER_ID").toString());
        String name = req.getParameter("name");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");
        Boolean aBoolean = addressService.addAddress(name, tel, address, userId);
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        Map<String,Object> map = new HashMap<>();
        map.put("result",aBoolean);
        writer.println(JSON.toJSONString(map));
        writer.close();
    }
}
