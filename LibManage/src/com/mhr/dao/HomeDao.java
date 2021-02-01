package com.mhr.dao;

import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;

import java.util.List;

public interface HomeDao {
    public List<BookBean> searchBooksByRandom(int num, String name) throws Exception;

    public int countBooks() throws  Exception;
    public  List<MsgBean>   searchMsgByDate(int num, String date,int limit) throws Exception;

    void easyinsert() throws Exception;

    public Object[] searchManageCategory() throws Exception;

    public List<BookBean> searchBooksByCondition(BookBean bookBean) throws Exception;

    List<BookBean> searchBooksByConditionCateogry(String c_name) throws Exception;
}
