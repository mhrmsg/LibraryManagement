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


@WebServlet(name = "HomeServlet", value = "/public/index")
public class HomeServlet extends BaseServlet {
    HomeService homeService = new HomeServiceImpl();

    public void userIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //用于控制用户跳转
        HttpSession session = request.getSession();
        if (null == session.getAttribute("admin")) {
            //普通用户跳转到普通页面
            response.sendRedirect(request.getContextPath() + "/public/bMy/MyIndex.jsp");
        } else {
            response.sendRedirect(request.getContextPath() + "/public/admin/index.jsp");
        }

    }

    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.invalidate();
        request.getRequestDispatcher("/public/login.jsp").forward(request,response);
    }

    public void searchBookByRandom(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //主页中随机查找图书
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
        //通过日期查找留言
        //限制查询个数 默认重要通知
        //0 代表重要通知 1 代表管理员 2 代表普通用户
        int num = 6;
        String date = request.getParameter("date");
        String relimit = request.getParameter("limit");
        int limit = 0;
        if (relimit != null) {
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

    public void searchAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //管理图书界面 ajax所请求的数据 为了美观 限制为随机5个
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

    public void searchByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //请求查询所有书库
        BookBean bookBean = new BookBean();
        List<BookBean> bookbeans = null;
        try {
            BeanUtils.populate(bookBean, request.getParameterMap());
            bookbeans = homeService.searchBooksByCondition(bookBean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("books", bookbeans);
        request.getRequestDispatcher("/public/bManage/ManageAll.jsp").forward(request, response);

    }

    public void searchByConditionCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过图书类别名 查出对应的图书
        String c_name = request.getParameter("c_name");
        List<BookBean> bookbeans = null;
        try {
            bookbeans = homeService.searchBooksByConditionCateogry(c_name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("books", bookbeans);
        request.getRequestDispatcher("/public/bManage/ManageAll.jsp").forward(request, response);
    }

    public void searchByBid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bid = request.getParameter("b_id");
        BookBean bookBean = null;
        String cname = "";
        try {
            bookBean = homeService.searchByBid(bid);
            cname = homeService.searchByCId(Integer.toString(bookBean.getC_id()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("book", bookBean);
        request.setAttribute("c_name", cname);
        request.getRequestDispatcher("/public/ABook.jsp").forward(request, response);
    }

    public void searchAllClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<BclassBean> bclass = null;
        try {
            bclass = homeService.searchAllClass();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = JSON.toJSONString(bclass);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(s);
        printWriter.close();
    }

    public void addNewBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookBean bookBean = new BookBean();
        bookBean.setB_name(request.getParameter("b_name"));
        bookBean.setB_author(request.getParameter("b_author"));
        bookBean.setB_publish(request.getParameter("b_publish"));
        bookBean.setU_tag(request.getParameter("u_tag"));
        bookBean.setB_info(request.getParameter("b_info"));
        if (null == request.getParameter("b_price"))
            bookBean.setB_price(0);
        else
            bookBean.setB_price(Integer.parseInt(request.getParameter("b_price")));
        bookBean.setB_pdate(request.getParameter("b_pdate"));
        if (null == request.getParameter("b_num"))
            bookBean.setB_num(0);
        else
        bookBean.setB_num(Integer.parseInt(request.getParameter("b_num")));

        //判断是否插入成功
        int msg = 0;
        //判断是否是新增类别，以及选择类别的处理
        String className = "";
        String bclass = request.getParameter("newclass");
        if (null != bclass && !bclass.trim().equals("")) {
            //当新增的bclass不为空
            className = bclass;
        } else {
            if (!request.getParameter("c_id").equals("选择类别"))
                className = request.getParameter("c_id").split(":")[1];
        }
        try {
//          BeanUtils.populate(bookBean,request.getParameterMap());
            msg = homeService.addNewBook(bookBean, className);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String s = "";
        if (msg == 1) {
            s = "插入成功";
        } else {
            s = "插入失败";
        }
        request.setAttribute("msg", s);
        request.getRequestDispatcher("/public/bManage/ManageNew.jsp").forward(request, response);

    }

    public void searchDelBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //查询需要删除的图书列表
        BookBean bookBean = new BookBean();
        List<BookBean> bookbeans = null;
        try {
            BeanUtils.populate(bookBean, request.getParameterMap());
            bookbeans = homeService.SearchDelBook(bookBean);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("books", bookbeans);
        request.getRequestDispatcher("/public/bManage/ManageOld.jsp").forward(request, response);

    }

    public void delBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String b_id = request.getParameter("b_id");
        int result = 0;
        try {
            result = homeService.delBook(b_id);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String msg = "";
        if (result == 0 ){
            msg = "删除失败";
        }else {
            msg = "删除成功";
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(msg);
        printWriter.close();
//        request.setAttribute("msg",msg);
//        request.getRequestDispatcher("/public/bManage/ManageOld.jsp").forward(request, response);
    }

    public  void  searchUNameById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String u_id = request.getParameter("u_id");
        UserBean userBean = null;
        try {
            userBean = homeService.searchUNameById(u_id);
        }  catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(userBean.getU_name());
        printWriter.close();
    }

    public void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String b_id = request.getParameter("b_id");
        String u_id = request.getParameter("u_id");
        String comment = request.getParameter("content");
        BookBean bookBean = null;
        int msg = 0;
        String s = "";
        try {
            bookBean = homeService.searchByBid(b_id);
            comment = bookBean.getU_comment() + u_id + ":"+ comment + ",";
            msg = homeService.addComment(b_id,comment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (msg >= 0)
            s = "评论成功";
        else s = "评论失败";
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(s);
        printWriter.close();

    }

    public void searchBLend(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String b_id = request.getParameter("b_id");
        List<UserBean> userBeans = null;
        try {
            userBeans = homeService.searchBLend(b_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String userlist = JSON.toJSONString(userBeans);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(userlist);
        printWriter.close();
    }

    public void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //用于生成数据库数据
        try {
            homeService.test();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
