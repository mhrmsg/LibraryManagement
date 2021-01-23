package com.mhr.web.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BaseServlet extends HttpServlet {
	
	 	@Override
	    protected void service(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {
	 		//利用反射机制调用
	 		req.setCharacterEncoding("utf-8");
	 		resp.setContentType("text/html; charset=utf-8");
	        String name = req.getParameter("method");
	        if(name == null || name.isEmpty()){
	            throw new RuntimeException("method parameter does not exist");
	        }
	        Class c = this.getClass();
	        Method method = null;
	        try {
	            method =  c.getMethod(name,HttpServletRequest.class,HttpServletResponse.class);
	        } catch (Exception e) {
	        }
	        try {
	            method.invoke(this, req,resp);
	        } catch (Exception e) {
	            throw new RuntimeException(e);
	        }
	    }
	 	
}
