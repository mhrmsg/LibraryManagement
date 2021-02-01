package com.mhr.entiy;

public class UserBean {
    private int u_id;
    private String u_name;
    private String u_paasword;
    private String u_email;
    private String u_phone;
    private String u_comment;
    private String u_sex;
    private String u_address;
    private String u_tag;
    private String u_birth;
    private String s_id;
    private String u_msg;

    public UserBean(int u_id, String u_name, String u_paasword, String u_email, String u_phone, String u_comment, String u_sex, String u_address, String u_tag, String u_birth, String s_id, String u_msg) {
        this.u_id = u_id;
        this.u_name = u_name;
        this.u_paasword = u_paasword;
        this.u_email = u_email;
        this.u_phone = u_phone;
        this.u_comment = u_comment;
        this.u_sex = u_sex;
        this.u_address = u_address;
        this.u_tag = u_tag;
        this.u_birth = u_birth;
        this.s_id = s_id;
        this.u_msg = u_msg;
    }

    public UserBean() {
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "u_id=" + u_id +
                ", u_name='" + u_name + '\'' +
                ", u_paasword='" + u_paasword + '\'' +
                ", u_email='" + u_email + '\'' +
                ", u_phone='" + u_phone + '\'' +
                ", u_comment='" + u_comment + '\'' +
                ", u_sex='" + u_sex + '\'' +
                ", u_address='" + u_address + '\'' +
                ", u_tag='" + u_tag + '\'' +
                ", u_birth='" + u_birth + '\'' +
                ", s_id='" + s_id + '\'' +
                ", u_msg='" + u_msg + '\'' +
                '}';
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_paasword() {
        return u_paasword;
    }

    public void setU_paasword(String u_paasword) {
        this.u_paasword = u_paasword;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public String getU_phone() {
        return u_phone;
    }

    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }

    public String getU_comment() {
        return u_comment;
    }

    public void setU_comment(String u_comment) {
        this.u_comment = u_comment;
    }

    public String getU_sex() {
        return u_sex;
    }

    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }

    public String getU_address() {
        return u_address;
    }

    public void setU_address(String u_address) {
        this.u_address = u_address;
    }

    public String getU_tag() {
        return u_tag;
    }

    public void setU_tag(String u_tag) {
        this.u_tag = u_tag;
    }

    public String getU_birth() {
        return u_birth;
    }

    public void setU_birth(String u_birth) {
        this.u_birth = u_birth;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public String getU_msg() {
        return u_msg;
    }

    public void setU_msg(String u_msg) {
        this.u_msg = u_msg;
    }
}
