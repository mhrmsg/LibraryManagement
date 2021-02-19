package com.mhr.dao.impl;

import com.mhr.common.C3P0Utils;
import com.mhr.dao.LoginDao;
import com.mhr.entiy.AdminBean;
import com.mhr.entiy.UserBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.sql.DataSource;

public class LoginDaoImpl implements LoginDao {
    DataSource dataSource = C3P0Utils.getDataSource();

    @Override
    public Object checkLogin(String uname, String pwd) throws Exception{
        QueryRunner queryRunner = new QueryRunner(dataSource);
        String sql = "select * from user where  (u_name=? or u_id=? or u_email=? or u_phone=?) and u_password=?";
        String[] params = {uname,uname,uname,uname,pwd};
        UserBean user = queryRunner.query(sql, new BeanHandler<UserBean>(UserBean.class), params);
        if(null == user){
            String[] adminParams = {uname,uname,pwd};
            sql = "select * from admin where  (admin_uname=? or admin_id=?) and admin_password=?";
            AdminBean admin = queryRunner.query(sql, new BeanHandler<AdminBean>(AdminBean.class), adminParams);
            return admin;
        }
        return user;
    }

}
