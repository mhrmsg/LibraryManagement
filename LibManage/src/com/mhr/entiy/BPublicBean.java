package com.mhr.entiy;

public class BPublicBean {
    private String b_id;
    private int b_readNum;  //点击量
    private int b_lendCount;    //借出次数
    private int b_supprot;      //点赞数
    private int b_attention;     //关注数

    public BPublicBean(String b_id) {
        this.b_id = b_id;
    }

    public BPublicBean(String b_id, int b_readNum, int b_lendCount, int b_supprot, int b_attention) {
        this.b_id = b_id;
        this.b_readNum = b_readNum;
        this.b_lendCount = b_lendCount;
        this.b_supprot = b_supprot;
        this.b_attention = b_attention;
    }

    public BPublicBean() {
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public int getB_readNum() {
        return b_readNum;
    }

    public void setB_readNum(int b_readNum) {
        this.b_readNum = b_readNum;
    }

    public int getB_lendCount() {
        return b_lendCount;
    }

    public void setB_lendCount(int b_lendCount) {
        this.b_lendCount = b_lendCount;
    }

    public int getB_supprot() {
        return b_supprot;
    }

    public void setB_supprot(int b_supprot) {
        this.b_supprot = b_supprot;
    }

    public int getB_attention() {
        return b_attention;
    }

    public void setB_attention(int b_attention) {
        this.b_attention = b_attention;
    }

    @Override
    public String toString() {
        return "BPublicBean{" +
                "b_id='" + b_id + '\'' +
                ", b_readNum=" + b_readNum +
                ", b_lendCount=" + b_lendCount +
                ", b_supprot=" + b_supprot +
                ", b_attention=" + b_attention +
                '}';
    }
}
