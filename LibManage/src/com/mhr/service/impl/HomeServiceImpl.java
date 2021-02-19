package com.mhr.service.impl;

import com.mhr.dao.HomeDao;
import com.mhr.dao.impl.HomeDaoImpl;
import com.mhr.entiy.BclassBean;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;
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

    @Override
    public BookBean searchByBid(String bid) throws Exception {
        return homeDao.searchByBid(bid);
    }

    @Override
    public String searchByCId(String cid) throws Exception {
        return homeDao.searchByCId(cid);
    }

    @Override
    public List<BclassBean> searchAllClass() throws Exception {
        return homeDao.searchAllClass();
    }

    @Override
    public int addNewBook(BookBean bookBean, String className) throws Exception{
        int cid = homeDao.searchByCName(className);
        //查询出来是否有该类别
        if (cid == 0){
            //没有该类别
            return homeDao.addNewBook(bookBean,className);
        }else {
            bookBean.setC_id(cid);
            return homeDao.addNewBook(bookBean);
        }
    }

    @Override
    public List<BookBean> SearchDelBook(BookBean bookBean) throws Exception {
        return homeDao.SearchDelBook(bookBean);
    }

    @Override
    public int delBook(String b_id) throws Exception {
        return  homeDao.delBook(b_id);
    }

    @Override
    public UserBean searchUNameById(String u_id) throws Exception {
        return homeDao.searchUNameById(u_id);
    }

    @Override
    public int addComment(String b_id, String comment) throws Exception {
        return homeDao.addComment(b_id,comment);
    }

    @Override
    public List<UserBean> searchBLend(String b_id) throws Exception {
        return homeDao.searchBLend(b_id);
    }


}
