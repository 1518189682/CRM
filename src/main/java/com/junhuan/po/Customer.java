package com.junhuan.po;


import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable{
    private int id;//ID
    private String name;//姓名
    private String sex;//性别
    private String phone;//手机号
    private String weixin;//微信号
    private String email;//邮箱
    private String idCard;//身份证号
    private Date date;//录入日期
    private String dateChange;//最近修改日期
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name)  {
        this.name = name;
    }
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getWeixin() {
        return weixin;
    }
    public void setWeixin(String weixin) {
        this.weixin = weixin;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getIdCard() {
        return idCard;
    }
    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    public String getDateChange() {
        return dateChange;
    }
    public void setDateChange(String dateChange) {
        this.dateChange = dateChange;
    }

}
