package com.oaec.b2c.servlet;

import com.oaec.b2c.service.BrandService;
import com.oaec.b2c.service.NavService;
import com.oaec.b2c.service.ProductService;
import com.oaec.b2c.service.impl.BrandServiceImpl;
import com.oaec.b2c.service.impl.NavServiceImpl;
import com.oaec.b2c.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;


@WebServlet("/product_list")
public class ListServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    private BrandService brandService = new BrandServiceImpl();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String classId = req.getParameter("classId");
        String brandId = req.getParameter("brandId");
        String page = req.getParameter("page");

        if(page == null){
            page = "1";
        }
        //查询全部
        List<Map<String,Object>> list = productService.query(name,classId,brandId,Integer.parseInt(page));
        req.setAttribute("list",list);



        //品牌
        List<Map<String, Object>> brands = brandService.query();
        req.setAttribute("brands",brands);


        //热销
        List<Map<String, Object>> hot = productService.hot();
        req.setAttribute("hot",hot);



        //转发到product_list.jsp
        req.getRequestDispatcher(("/WEB-INF/views/product_list.jsp")).forward(req,resp);
    }
}
