package com.mhr.service;

import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;

import java.util.List;
import java.util.Map;

public interface HomeService{
    public List<BookBean> searchBooksByRandom(int num, String name) throws Exception;
    public int countBooks() throws Exception;
    public List<MsgBean> searchMsgByDate(int num, String date,int limit) throws Exception;
    public void test() throws Exception;

    public  Object[] searchManageCategory() throws Exception;

    public List<BookBean> searchBooksByCondition(BookBean bookBean) throws Exception;

    public List<BookBean> searchBooksByConditionCateogry(String c_name) throws Exception;

    public BookBean searchByBid(String bid) throws Exception;

    public String searchByCId(String cid) throws Exception;

    public List<BclassBean> searchAllClass() throws Exception;

    public int addNewBook(BookBean bookBean, String className) throws Exception;

    public List<BookBean> SearchDelBook(BookBean bookBean) throws Exception;

    public int delBook(String b_id) throws Exception;

    UserBean searchUNameById(String u_id) throws Exception;

    int addComment(String b_id, String comment) throws Exception;

    List<UserBean> searchBLend(String b_id) throws Exception;
}
