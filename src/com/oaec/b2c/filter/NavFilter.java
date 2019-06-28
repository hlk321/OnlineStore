package com.oaec.b2c.filter;

import com.oaec.b2c.service.NavService;
import com.oaec.b2c.service.impl.NavServiceImpl;
import com.oaec.b2c.util.HttpFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebFilter({"/index","/product_list","/product","/login","/register","/cart"})
public class NavFilter extends HttpFilter {

    private NavService navService = new NavServiceImpl();

    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        List<Map<String,Object>> navNv = navService.getNavNv();
        List<Map<String,Object>> navNan = navService.getNavNan();
        request.setAttribute("navNv",navNv);
        request.setAttribute("navNan",navNan);

        filterChain.doFilter(request,response);

    }
}
