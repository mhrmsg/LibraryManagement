package com.mhr.entiy;

public class AdminBean {
    private int admin_id;   //管理员Id
    private String admin_uname;     //管理员昵称
    private String admin_password;  //管理员密码
    private int admin_limit;   //管理员权限
    private String message;     //通知

    public AdminBean(int admin_id, String admin_uname, String admin_password, int admin_limit, String message) {
        this.admin_id = admin_id;
        this.admin_uname = admin_uname;
        this.admin_password = admin_password;
        this.admin_limit = admin_limit;
        this.message = message;
    }

    public AdminBean() {
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public String getAdmin_uname() {
        return admin_uname;
    }

    public void setAdmin_uname(String admin_uname) {
        this.admin_uname = admin_uname;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    public int getAdmin_limit() {
        return admin_limit;
    }

    public void setAdmin_limit(int admin_limit) {
        this.admin_limit = admin_limit;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "AdminBean{" +
                "admin_id=" + admin_id +
                ", admin_uname='" + admin_uname + '\'' +
                ", admin_password='" + admin_password + '\'' +
                ", admin_limit=" + admin_limit +
                ", message='" + message + '\'' +
                '}';
    }
}
