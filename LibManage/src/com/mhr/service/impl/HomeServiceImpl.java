package com.mhr.service.impl;

import com.mhr.dao.HomeDao;
import com.mhr.dao.impl.HomeDaoImpl;
import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.service.HomeService;

import java.util.List;

public class HomeServiceImpl implements HomeService {
    HomeDao homeDao = new HomeDaoImpl();

    @Override
    public List<BookBean> searchBooksByRandom(int num, String name) throws Exception{
        if(null == name || "".equals(name.trim())){
            name = "_";
        }

        return  homeDao.searchBooksByRandom(num,name);
    }

    @Override
    public int countBooks() throws Exception {
        return homeDao.countBooks();
    }

    @Override
    public List<MsgBean> searchMsgByDate(int num, String date,int limit) throws Exception {
        List<MsgBean> msgBeans = homeDao.searchMsgByDate(num, date,limit);
        return   msgBeans;
    }

    @Override
    public void test()  throws Exception {
        homeDao.easyinsert();
    }



    @Override
    public Object[] searchManageCategory() throws Exception{
        return homeDao.searchManageCategory();
    }

    @Override
    public List<BookBean> searchBooksByCondition(BookBean bookBean) throws Exception {
        return homeDao.searchBooksByCondition(bookBean);
    }

    @Override
    public List<BookBean> searchBooksByConditionCateogry(String c_name) throws Exception{
        return homeDao.searchBooksByConditionCateogry(c_name);
    }
}
