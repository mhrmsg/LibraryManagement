package com.mhr.entiy;

public class MsgBean {
    private int admin_id;
    private int u_id;
    private String msg;
    private String date;

    @Override
    public String toString() {
        return "MsgBean{" +
                "admin_id=" + admin_id +
                ", u_id=" + u_id +
                ", msg='" + msg + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

    public int getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(int admin_id) {
        this.admin_id = admin_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public MsgBean() {
    }

    public MsgBean(int admin_id, int u_id, String msg, String date) {
        this.admin_id = admin_id;
        this.u_id = u_id;
        this.msg = msg;
        this.date = date;
    }
}
