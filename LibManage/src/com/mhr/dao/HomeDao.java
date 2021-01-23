package com.mhr.dao;

import com.mhr.entiy.BookBean;

import java.util.List;

public interface HomeDao {
    public List<BookBean> searchBooks(int num, String name) throws Exception;

    public int countBooks() throws  Exception;
}
