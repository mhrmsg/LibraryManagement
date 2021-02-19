package com.mhr.dao.impl;

import com.mhr.common.C3P0Utils;
import com.mhr.dao.AdminDao;
import com.mhr.entiy.BookBean;
import com.mhr.entiy.MsgBean;
import com.mhr.entiy.UserBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import javax.sql.DataSource;
import java.util.List;

public class AdminDaoImpl implements AdminDao {
    DataSource dataSource = C3P0Utils.getDataSource();
    QueryRunner queryRunner = new QueryRunner(dataSource);


    @Override
    public int updateBook(BookBean bookBean) throws Exception{
        String sql = "update book set b_name = ? , b_author = ? ,  b_publish = ? , b_info = ? , b_language = ? , b_price = ? , b_pdate = ? , c_id = ? where b_id = ?";
        Object[] params = {bookBean.getB_name(),bookBean.getB_author(),bookBean.getB_publish(),bookBean.getB_info(),bookBean.getB_language(),bookBean.getB_price(),bookBean.getB_pdate(),bookBean.getC_id(),bookBean.getB_id()};
        return queryRunner.update(sql, params);
    }

    @Override
    public List<MsgBean> searchMsgByDate(String mdate) throws Exception {
        String sql = "select * from msg where date = ?";
        return queryRunner.query(sql,new BeanListHandler<MsgBean>(MsgBean.class),mdate);
    }

    @Override
    public List<MsgBean> searchMsgById(String mid) throws Exception {
        String sql = "select * from msg where admin_id = ? or u_id = ?";
        return queryRunner.query(sql,new BeanListHandler<MsgBean>(MsgBean.class),mid,mid);
    }

    @Override
    public List<MsgBean> searchMsgByIdAndDate(String mid, String mdate) throws Exception {
        String sql = "select * from msg where ( admin_id = ? or u_id = ? ) and date = ?";
        return queryRunner.query(sql,new BeanListHandler<MsgBean>(MsgBean.class),mid,mid,mdate);

    }

    @Override
    public List<UserBean> searchUserByName(String uname) throws Exception {
        String sql = "select * from user where u_name like ?";
        String likename = "%" + uname + "%";
        return queryRunner.query(sql,new BeanListHandler<UserBean>(UserBean.class),likename);
    }

    @Override
    public List<UserBean> searchUserByID(String uid) throws Exception {
        String sql ="select * from user where u_id =  ? ";
        return queryRunner.query(sql,new BeanListHandler<UserBean>(UserBean.class),uid);
    }

    @Override
    public List<UserBean> searchUserByIdAndName(String uid, String uname) throws Exception {
        String likename = "%" + uname + "%";
        String sql = "select * from user where u_id = ? and u_name like ?";
        return queryRunner.query(sql,new BeanListHandler<UserBean>(UserBean.class),uid,likename);
    }

    @Override
    public int delMsg(String id,String mdate) throws Exception {
        String sql = "delete from msg where (admin_id = ? or u_id = ?) and date = ?";
        return queryRunner.update(sql,id,id,mdate);
    }

    @Override
    public int updateMSg(String id,String msgContent,String mdate) throws Exception {
        String sql = "update msg set msg = ? where ( admin_id = ? or u_id = ? ) and date = ? ";
        return queryRunner.update(sql,msgContent,id,id,mdate);
    }

    @Override
    public int delUser(String uid) throws Exception {
        String sql = "delete from user where u_id = ?";
        return queryRunner.update(sql,uid);
    }


}
