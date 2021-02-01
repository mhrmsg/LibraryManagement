package com.mhr.web.servlet;

import com.alibaba.fastjson.JSON;
import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;
import com.mhr.service.HomeService;
import com.mhr.service.impl.HomeServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "HomeServlet",value = "/public/index")
public class HomeServlet extends BaseServlet {
    HomeService homeService = new HomeServiceImpl();

    public void userIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        if (null == session.getAttribute("admin")){
            //普通用户跳转到普通页面
            response.sendRedirect(request.getContextPath()+"/public/bMy/MyIndex.jsp");
        }else{
            response.sendRedirect(request.getContextPath()+"/public/admin/index.jsp");
        }

    }

    public void searchBookByRandom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num = request.getParameter("num");
        String name = request.getParameter("name");
        int bnum = Integer.parseInt(num);
        List<BookBean> bookBeans = null;
        try {
            bookBeans = homeService.searchBooksByRandom(bnum, name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = JSON.toJSONString(bookBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();

        printWriter.print(s);
        printWriter.close();

    }

    public void searchMsgByDate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //限制查询个数 默认重要通知
        //0 代表重要通知 1 代表管理员 2 代表普通用户
        int num = 6;
        String date = request.getParameter("date");
        String relimit = request.getParameter("limit");
        int limit = 0;
        if(relimit != null){
            limit = Integer.parseInt(relimit);
        }
        date = "2020-11-01";
        List<MsgBean> msgBeans = null;
        try {
            msgBeans = homeService.searchMsgByDate(num, date, limit);
            homeService.searchMsgByDate(num, date, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = JSON.toJSONString(msgBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(s);
        printWriter.close();
    }

    public void searchAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Object[] mCategory = null;
        List<BclassBean> bclass = null;
        List<BookBean> taglist = null;
        List<BookBean> publish = null;
        List<BookBean> pdate = null;
        try {
            mCategory = homeService.searchManageCategory();
            bclass = (List<BclassBean>) mCategory[0];
            taglist = (List<BookBean>) mCategory[1];
            publish = (List<BookBean>) mCategory[2];
            pdate = (List<BookBean>) mCategory[3];
        } catch (Exception e) {
            e.printStackTrace();
        }
        String bs = JSON.toJSONString(bclass);
        String tl = JSON.toJSONString(taglist);
        String pl = JSON.toJSONString(publish);
        String pd = JSON.toJSONString(pdate);
        String commit = bs + "---" + tl + "---" + pl + "---" + pd;
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(commit);
        printWriter.close();
    }

    public void searchByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookBean bookBean = new BookBean();
        List<BookBean> bookbeans = null;
        try {
            BeanUtils.populate(bookBean,request.getParameterMap());
            bookbeans = homeService.searchBooksByCondition(bookBean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("books",bookbeans);
        request.getRequestDispatcher("/public/bManage/ManageAll.jsp").forward(request,response);
//        String bId = request.getParameter("b_id");
//        String bpdate = request.getParameter("b_pdate");
//        String bname = request.getParameter("b_name");
//        String bclass = request.getParameter("c_id");
//        String autor = request.getParameter("b_autor");
//        String bpublish = request.getParameter("b_publish");
//        String u_tag = request.getParameter("u_tag");
    }

    public void searchByConditionCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //通过图书类别名 查出对应的图书
        String c_name = request.getParameter("c_name");
        List<BookBean> bookbeans = null;
        try {
            bookbeans = homeService.searchBooksByConditionCateogry(c_name);
        }  catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("books",bookbeans);
        request.getRequestDispatcher("/public/bManage/ManageAll.jsp").forward(request,response);
    }

    public void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            homeService.test();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
