package com.oaec.b2c.servlet;

import com.oaec.b2c.service.ProductService;
import com.oaec.b2c.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String productId = req.getParameter("productId");
        System.out.println("productId = " + productId);
//        String brandId = req.getParameter("brandId");
//        String classId = req.getParameter("classId");

        Map<String,Object> product = productService.getProduct(productId);
        req.setAttribute("product",product);

        List<Map<String, Object>> hot = productService.hot();
        req.setAttribute("hot",hot);

        req.getRequestDispatcher("/WEB-INF/views/product.jsp").forward(req,resp);
    }
}
