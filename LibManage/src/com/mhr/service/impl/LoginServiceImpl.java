package com.mhr.service.impl;

import com.mhr.dao.LoginDao;
import com.mhr.dao.impl.LoginDaoImpl;
import com.mhr.service.LoginSerivce;

public class LoginServiceImpl implements LoginSerivce {
    LoginDao loginDao = new LoginDaoImpl();

    @Override
    public Object checkLogin(String uname, String pwd) throws Exception{
        return loginDao.checkLogin(uname,pwd);
    }
}
