package com.mhr.dao.impl;

import com.mhr.common.C3P0Utils;
import com.mhr.dao.HomeDao;
import com.mhr.entiy.BookBean;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import javax.sql.DataSource;
import java.util.List;

public class HomeDaoImpl implements HomeDao {
    DataSource dataSource = C3P0Utils.getDataSource();
    QueryRunner queryRunner = new QueryRunner(dataSource);
    String sql = "";

    @Override
    public List<BookBean> searchBooks(int num, String name) throws Exception{
        //https://blog.csdn.net/liqing0013/article/details/83040946 随机查询
        sql = "select * from book where b_name like ? order by RAND() limit ?";
        String likename= "%" +  name.trim() + "%";
        Object[] params = {likename,num};
        List<BookBean> query = queryRunner.query(sql, new BeanListHandler<BookBean>(BookBean.class), params);
        return query;
    }

    @Override
    public int countBooks() throws Exception {
        sql = "select count(1) from book";
        Long num = (Long) queryRunner.query(sql,new ScalarHandler());
        return num.intValue();
    }


}
