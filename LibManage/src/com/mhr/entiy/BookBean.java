package com.mhr.entiy;

import java.util.Date;

public class BookBean {
    private int b_id;    //图书ID
    private String b_name;  //图书名
    private String b_author;    //作者
    private String b_publish;   //图书信息
    private String b_info;      //图书简介
    private String b_language;  //语言
    private double b_price;     //价格
    private String b_pdate;     //出版日期
    private int b_num;          //剩余数量
    private int c_id;   //分类id
    private String u_comment;    //用户评价
    private String u_tag;       //用户标签
    private String u_id;        //用户借阅id
    private BPublicBean bPublicBean;  //书籍数据


    public BookBean(int b_id, String b_name, String b_author, String b_publish, String b_info, String b_language, double b_price, String b_pdate, int b_num, int c_id) {
        this.b_id = b_id;
        this.b_name = b_name;
        this.b_author = b_author;
        this.b_publish = b_publish;
        this.b_info = b_info;
        this.b_language = b_language;
        this.b_price = b_price;
        this.b_pdate = b_pdate;
        this.b_num = b_num;
        this.c_id = c_id;
    }

    public BookBean() {
    }

    public int getB_id() {
        return b_id;
    }

    public void setB_id(int b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }

    public String getB_author() {
        return b_author;
    }

    public void setB_author(String b_author) {
        this.b_author = b_author;
    }

    public String getB_publish() {
        return b_publish;
    }

    public void setB_publish(String b_publish) {
        this.b_publish = b_publish;
    }

    public String getB_info() {
        return b_info;
    }

    public void setB_info(String b_info) {
        this.b_info = b_info;
    }

    public String getB_language() {
        return b_language;
    }

    public void setB_language(String b_language) {
        this.b_language = b_language;
    }

    public double getB_price() {
        return b_price;
    }

    public void setB_price(double b_price) {
        this.b_price = b_price;
    }

    public String getB_pdate() {
        return b_pdate;
    }

    public void setB_pdate(String b_pdate) {
        this.b_pdate = b_pdate;
    }

    public int getB_num() {
        return b_num;
    }

    public void setB_num(int b_num) {
        this.b_num = b_num;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getU_comment() {
        return u_comment;
    }

    public void setU_comment(String u_comment) {
        this.u_comment = u_comment;
    }

    public String getU_tag() {
        return u_tag;
    }

    public void setU_tag(String u_tag) {
        this.u_tag = u_tag;
    }

    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }

    public BPublicBean getbPublicBean() {
        return bPublicBean;
    }

    public void setbPublicBean(BPublicBean bPublicBean) {
        this.bPublicBean = bPublicBean;
    }

    @Override
    public String toString() {
        return "BookBean{" +
                "b_id='" + b_id + '\'' +
                ", b_name='" + b_name + '\'' +
                ", b_author='" + b_author + '\'' +
                ", b_publish='" + b_publish + '\'' +
                ", b_info='" + b_info + '\'' +
                ", b_language='" + b_language + '\'' +
                ", b_price=" + b_price +
                ", b_pdate='" + b_pdate + '\'' +
                ", b_num=" + b_num +
                ", c_id=" + c_id +
                ", u_comment='" + u_comment + '\'' +
                ", u_tag='" + u_tag + '\'' +
                ", u_id='" + u_id + '\'' +
                ", bPublicBean=" + bPublicBean +
                '}';
    }
}
