package com.junhuan.po;

import java.io.Serializable;

public class Jobs implements Serializable{

    private int id;//岗位ID
    private String j_no;//岗位编号
    private String j_name;//岗位名称

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getJ_no() {
        return j_no;
    }
    public void setJ_no(String j_no) {
        this.j_no = j_no;
    }
    public String getJ_name() {
        return j_name;
    }
    public void setJ_name(String j_name) {
        this.j_name = j_name;
    }



}
