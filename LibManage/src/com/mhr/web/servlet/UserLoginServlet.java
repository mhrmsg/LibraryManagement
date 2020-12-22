package com.mhr.web.servlet;

import com.mhr.entiy.UserBean;
import com.mhr.service.LoginSerivce;
import com.mhr.service.impl.LoginServiceImpl;

import java.io.IOException;
import java.net.HttpCookie;

public class UserLoginServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");
        LoginSerivce loginSerivce = new LoginServiceImpl();
        //checkresult 从数据库传来的用户数据
        Object checkresult = null;
        try {
            checkresult = loginSerivce.checkLogin(uname, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (null == checkresult){
            request.setAttribute("msg","登陆失败");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else {
            //判断是管理员还是普通用户
            Class<?> checkresultClass = checkresult.getClass();
            boolean classCheck = checkresultClass.equals(UserBean.class);
            if (classCheck){
                request.getSession().setAttribute("user",checkresult);
            }
            else {
                request.getSession().setAttribute("admin",checkresult);
            }
        }
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
