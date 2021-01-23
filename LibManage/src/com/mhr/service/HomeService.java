package com.mhr.service;

import com.mhr.entiy.BookBean;

import java.util.List;

public interface HomeService{
    public List<BookBean> searchBooks(int num, String name) throws Exception;
    public int countBooks() throws Exception;
}
