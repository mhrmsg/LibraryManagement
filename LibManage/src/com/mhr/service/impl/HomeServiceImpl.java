package com.mhr.service.impl;

import com.mhr.dao.HomeDao;
import com.mhr.dao.impl.HomeDaoImpl;
import com.mhr.entiy.BookBean;
import com.mhr.service.HomeService;
import com.mhr.service.LoginSerivce;

import java.util.List;

public class HomeServiceImpl implements HomeService {
    HomeDao homeDao = new HomeDaoImpl();

    @Override
    public List<BookBean> searchBooks(int num, String name) throws Exception{
        if(null == name || "".equals(name.trim())){
            name = "_";
        }

        return  homeDao.searchBooks(num,name);
    }

    @Override
    public int countBooks() throws Exception {
        return homeDao.countBooks();
    }
}
