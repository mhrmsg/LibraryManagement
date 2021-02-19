package com.mhr.web.servlet;

import com.alibaba.fastjson.JSON;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;
import com.mhr.service.AdminService;
import com.mhr.service.impl.AdminServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.print.Book;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/public/admin")

public class AdminServlet extends BaseServlet {
    AdminService adminService = new AdminServiceImpl();

    //修改书籍信息
    public void updateBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookBean bookBean = new BookBean();
        int res = 0;
        try {
            BeanUtils.populate(bookBean, request.getParameterMap());
            res = adminService.updateBook(bookBean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String msg = "";
        if (res == 0) {
            msg = "修改失败";
        } else {
            msg = "修改成功";
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(msg);
        printWriter.close();
    }

    //留言查询
    public void searchMsg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mdate = request.getParameter("date").trim();
        String mid = request.getParameter("mid").trim();
        List<MsgBean> msgBeans = null;
        try {
            if (null == mid || mid.trim().equals("")) {
                msgBeans = adminService.searchMsgByDate(mdate);
            } else if (null == mdate || mdate.trim().equals("")) {
                msgBeans = adminService.searchMsgById(mid);
            } else {
                //当两个条件都存在时
                msgBeans = adminService.searchMsgByIdAndDate(mid, mdate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        String s = JSON.toJSONString(msgBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(s);
        printWriter.close();
    }


    //留言修改 保存、删除
    public void msgoperation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String state = request.getParameter("state");
        String id = request.getParameter("id");
        String msgContent = request.getParameter("msgcontent");
        String mdate = request.getParameter("date");
        int res = 0;
        String msg = "";
        try {
            if (state.equals("del")) {
                res = adminService.delMsg(id,mdate);
            } else {
                res = adminService.updateMsg(id,msgContent,mdate);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(msg);
        if (res != 0) {
            msg = "操作成功";
        } else {
            msg = "操作失败";
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(msg);
        printWriter.close();
    }

    //用户查询
    public void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname").trim();
        String uid = request.getParameter("uid").trim();
        List<UserBean> userBeans = null;
        try {
            if (null == uid || uid.trim().equals("")) {
                userBeans = adminService.searchUserByName(uname);
            } else if (null == uname || uname.trim().equals("")) {
                userBeans = adminService.searchUserByID(uid);
            } else {
                userBeans = adminService.searchUserByIdAndName(uid, uname);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = JSON.toJSONString(userBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(s);
        printWriter.close();
    }

    public void delUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        int res = 0;
        String msg = "";
        try {
            res = adminService.delUser(uid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (res != 0) {
            msg = "操作成功";
        } else {
            msg = "操作失败";
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(msg);
        printWriter.close();
    }


}

