package com.mhr.entiy;


import java.util.ArrayList;

public class SchoolCardBean {
    private String s_id;    //校园卡号
    private int s_money;    //校园余额
    private String  s_password;     //校园卡密码
    private int s_state;        //校园卡状态 0|1
//    private String b_id;    //图书id
//    private String b_lendDate;  //借书时间
//    private String b_backDate;  //归还时间
    private ArrayList<String> bList;
    private String s_bill;      //账单

    public SchoolCardBean() {
    }

    public SchoolCardBean(String s_id, int s_money, String s_password, int s_state, ArrayList<String> bList, String s_bill) {
        this.s_id = s_id;
        this.s_money = s_money;
        this.s_password = s_password;
        this.s_state = s_state;
        this.bList = bList;
        this.s_bill = s_bill;
    }

    public SchoolCardBean(String s_id, String s_password, int s_state) {
        this.s_id = s_id;
        this.s_password = s_password;
        this.s_state = s_state;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public int getS_money() {
        return s_money;
    }

    public void setS_money(int s_money) {
        this.s_money = s_money;
    }

    public String getS_password() {
        return s_password;
    }

    public void setS_password(String s_password) {
        this.s_password = s_password;
    }

    public int getS_state() {
        return s_state;
    }

    public void setS_state(int s_state) {
        this.s_state = s_state;
    }

    public ArrayList<String> getbList() {
        return bList;
    }

    public void setbList(ArrayList<String> bList) {
        this.bList = bList;
    }

    public String getS_bill() {
        return s_bill;
    }

    public void setS_bill(String s_bill) {
        this.s_bill = s_bill;
    }

    @Override
    public String toString() {
        return "SchoolCardBean{" +
                "s_id='" + s_id + '\'' +
                ", s_money=" + s_money +
                ", s_password='" + s_password + '\'' +
                ", s_state=" + s_state +
                ", bList=" + bList +
                ", s_bill='" + s_bill + '\'' +
                '}';
    }
}
