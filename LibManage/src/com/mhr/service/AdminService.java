package com.mhr.service;

import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;

import java.util.List;

public interface AdminService {
    public int updateBook(BookBean bookBean) throws Exception;

    public List<MsgBean> searchMsgByDate(String mdate) throws Exception;

    List<MsgBean> searchMsgById(String mid) throws Exception;

    List<MsgBean> searchMsgByIdAndDate(String mid, String mdate) throws Exception;

    List<UserBean> searchUserByName(String uname) throws Exception;

    List<UserBean> searchUserByID(String uid) throws Exception;

    List<UserBean> searchUserByIdAndName(String uid, String uname) throws Exception;

    public int delMsg(String id,String mdate) throws Exception;

    int updateMsg(String id,String msgContent,String mdate) throws Exception;

    int delUser(String uid) throws Exception;
}
