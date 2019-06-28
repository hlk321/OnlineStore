package com.oaec.b2c.servlet;

import com.oaec.b2c.service.AddressService;
import com.oaec.b2c.service.impl.AddressServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/address/delete")
public class DeleteAddressServlet extends HttpServlet {

    private AddressService addressService = new AddressServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*Boolean result = addressService.deleteAddress(Integer.parseInt(req.getParameter("addressId")));
        */
        Boolean result = addressService.updateAddress(Integer.parseInt(req.getParameter("addressId")));
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.println("{\"result\":"+result+"}");
        writer.close();
    }
}
