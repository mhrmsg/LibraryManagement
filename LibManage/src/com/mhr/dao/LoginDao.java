package com.mhr.dao;

public interface LoginDao {
    public Object checkLogin(String uname, String pwd) throws Exception;
}
