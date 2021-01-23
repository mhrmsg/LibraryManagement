package com.mhr.web.servlet;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.mhr.entiy.BookBean;
import com.mhr.service.HomeService;
import com.mhr.service.impl.HomeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "HomeServlet",value = "/public/index")
public class HomeServlet extends BaseServlet {
    HomeService homeService = new HomeServiceImpl();
    public void searchBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String name = request.getParameter("name");
        int bnum = Integer.parseInt(num);
        List<BookBean> bookBeans = null;
        try {
            bookBeans = homeService.searchBooks(bnum, name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = JSON.toJSONString(bookBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();

        printWriter.print(s);
        printWriter.close();

    }

    public void refresh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
