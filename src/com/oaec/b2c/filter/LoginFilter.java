package com.oaec.b2c.filter;

import com.alibaba.fastjson.JSON;
import com.oaec.b2c.util.HttpFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebFilter({"/cart","/add2cart","/cart/delete","/updateAmount","/user","/submit","/address"})
public class LoginFilter extends HttpFilter {
    @Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = request.getSession();
//        if(session.getAttribute("username") == null){
        String requestURI = request.getRequestURI();
        String queryString = request.getQueryString();
        System.out.println("requestURI = " + requestURI);
        if (requestURI.contains("/add2cart")){
            requestURI = request.getContextPath() + "/product?productId="+request.getParameter("productId");
        }
        if(session.getAttribute("user") == null){
            if(isAjax(request)){
                response.setContentType("application/json;charset=utf-8");
                PrintWriter writer = response.getWriter();
                Map<String,Object> map = new HashMap<>();
                map.put("uri",requestURI);
                map.put("isLogin",false);
                writer.println(JSON.toJSONString(map));
                writer.close();
            } else {

                response.sendRedirect(request.getContextPath()+"/login?uri="+requestURI+"?"+queryString);
            }


        }else {
            filterChain.doFilter(request,response);
        }
    }
    private boolean isAjax(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        if(header != null && header.equals("XMLHttpRequest")){
            return true;
        }
        return false;
    }
    /*@Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpSession session = request.getSession();
        if(session.getAttribute("user") == null){
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        filterChain.doFilter(request,response);
    }*/
}
