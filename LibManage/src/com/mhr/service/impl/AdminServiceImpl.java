package com.mhr.service.impl;

import com.mhr.dao.AdminDao;
import com.mhr.dao.impl.AdminDaoImpl;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;
import com.mhr.service.AdminService;

import java.util.List;

public class AdminServiceImpl implements AdminService {
    AdminDao adminDao = new AdminDaoImpl();

    @Override
    public int updateBook(BookBean bookBean) throws Exception{
       return adminDao.updateBook(bookBean);
    }

    @Override
    public List<MsgBean> searchMsgByDate(String mdate) throws Exception {
        return adminDao.searchMsgByDate(mdate);
    }

    @Override
    public List<MsgBean> searchMsgById(String mid) throws Exception {
        return adminDao.searchMsgById(mid);
    }

    @Override
    public List<MsgBean> searchMsgByIdAndDate(String mid, String mdate) throws Exception {
        return adminDao.searchMsgByIdAndDate(mid,mdate);
    }

    @Override
    public List<UserBean> searchUserByName(String uname) throws Exception {
        return adminDao.searchUserByName(uname);
    }

    @Override
    public List<UserBean> searchUserByID(String uid) throws Exception {
        return adminDao.searchUserByID(uid);
    }

    @Override
    public List<UserBean> searchUserByIdAndName(String uid, String uname) throws Exception {
        return adminDao.searchUserByIdAndName(uid,uname);
    }

    @Override
    public int delMsg(String id,String mdate) throws Exception {
        return adminDao.delMsg(id,mdate);
    }

    @Override
    public int updateMsg(String id,String msgContent,String mdate) throws Exception {
        return adminDao.updateMSg(id,msgContent,mdate);
    }

    @Override
    public int delUser(String uid) throws Exception {
        return adminDao.delUser(uid);
    }
}
