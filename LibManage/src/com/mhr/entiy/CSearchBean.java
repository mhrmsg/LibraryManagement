package com.mhr.entiy;

public class CSearchBean {
    private String c_id;
    private String c_name;
    private String u_tag;
    private String b_publish;
    private String b_pdate;
    private String other;

    public CSearchBean(String c_id, String c_name, String u_tag, String b_publish, String b_pdate, String other) {
        this.c_id = c_id;
        this.c_name = c_name;
        this.u_tag = u_tag;
        this.b_publish = b_publish;
        this.b_pdate = b_pdate;
        this.other = other;
    }

    @Override
    public String toString() {
        return "CSearchBean{" +
                "c_id='" + c_id + '\'' +
                ", c_name='" + c_name + '\'' +
                ", u_tag='" + u_tag + '\'' +
                ", b_publish='" + b_publish + '\'' +
                ", b_pdate='" + b_pdate + '\'' +
                ", other='" + other + '\'' +
                '}';
    }

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public String getC_name() {
        return c_name;
    }

    public void setC_name(String c_name) {
        this.c_name = c_name;
    }

    public String getU_tag() {
        return u_tag;
    }

    public void setU_tag(String u_tag) {
        this.u_tag = u_tag;
    }

    public String getB_publish() {
        return b_publish;
    }

    public void setB_publish(String b_publish) {
        this.b_publish = b_publish;
    }

    public String getB_pdate() {
        return b_pdate;
    }

    public void setB_pdate(String b_pdate) {
        this.b_pdate = b_pdate;
    }

    public String getOther() {
        return other;
    }

    public void setOther(String other) {
        this.other = other;
    }

    public CSearchBean() {
    }
}
