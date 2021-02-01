package com.mhr.web.filter;

import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",urlPatterns = "/*",initParams= {@WebInitParam(name="login",value="login.jsp")})
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        String uri = request.getRequestURI();
        //判断是否包含登录相关资源路径
        if( uri.contains("/login") || uri.contains("/static/") ) {
            chain.doFilter(req, resp);
        }
        else {
            //验证用户是否登录
            Object user = request.getSession().getAttribute("user");
            Object admin = request.getSession().getAttribute("admin");
            if(null != user || null != admin){
                chain.doFilter(req,resp);
            }else {
//                request.setAttribute("login_msg","尚未登录，请登录");
//                request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request,resp);
//                System.out.println(request.getContextPath()+"/public/login.jsp");
                response.sendRedirect(request.getContextPath()+"/public/login.jsp");
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {
    }

}
