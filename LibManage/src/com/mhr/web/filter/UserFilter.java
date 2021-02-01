package com.mhr.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "UserFilter",urlPatterns = "/public/admin/*")
public class UserFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        //判断是否是管理员
        if(null ==  req.getSession().getAttribute("admin")){
            resp.sendRedirect(req.getContextPath()+"/public/index.jsp");
        }else {
            chain.doFilter(req,resp);
        }


    }
}
