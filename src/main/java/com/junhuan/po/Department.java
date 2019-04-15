package com.junhuan.po;

import java.io.Serializable;

public class Department implements Serializable{

    private int id;//部门id
    private String d_no;//部门编号
    private String d_name;//部门名称
    private String d_number;//部门人数

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getD_no() {
        return d_no;
    }
    public void setD_no(String d_no) {
        this.d_no = d_no;
    }
    public String getD_name() {
        return d_name;
    }
    public void setD_name(String d_name) {
        this.d_name = d_name;
    }
    public String getD_number() {
        return d_number;
    }
    public void setD_number(String d_number) {
        this.d_number = d_number;
    }



}
