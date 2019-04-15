package com.junhuan.po;
import java.io.Serializable;
import java.util.Date;
/**
 * 员工持久化类
 */
public class Staff implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;//ID
    private String u_name;//姓名
    private String u_sex;//性别
    private String u_idcard;//身份证号
    private String u_phone;//手机号
    private String u_weixin;//微信号
    private String u_email;//邮箱
    private String username;//账号
    private String password;//密码
    private Jobs jobs;//岗位
    private Department department;//部门
    private Permission permission;//权限
    private Date date;//入职日期
    private Integer start;            // 起始行
    private Integer rows;             // 所取行数
    public Staff(String u_name,String u_sex,String u_idcard,String u_phone,String u_weixin,
                 String u_email,String username,String password,Jobs jobs,Department department,Permission permission,Date date) {
        this.setU_name(u_name);
        this.setU_sex(u_sex);
        this.setU_idcard(u_idcard);
        this.setU_phone(u_phone);
        this.setU_weixin(u_weixin);
        this.setU_email(u_email);
        this.setUsername(username);
        this.setPassword(password);
        this.setJobs(jobs);
        this.setDepartment(department);
        this.setPermission(permission);
        this.setDate(date);
    }
    public Staff() {}
    public Jobs getJobs() {
        return jobs;
    }
    public void setJobs(Jobs jobs) {
        this.jobs = jobs;
    }
    public Department getDepartment() {
        return department;
    }
    public void setDepartment(Department department) {
        this.department = department;
    }
    public Permission getPermission() {
        return permission;
    }
    public void setPermission(Permission permission) {
        this.permission = permission;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getU_name() {
        return u_name;
    }
    public void setU_name(String u_name) {
        this.u_name = u_name;
    }
    public String getU_sex() {
        return u_sex;
    }
    public void setU_sex(String u_sex) {
        this.u_sex = u_sex;
    }
    public String getU_phone() {
        return u_phone;
    }
    public void setU_phone(String u_phone) {
        this.u_phone = u_phone;
    }
    public String getU_weixin() {
        return u_weixin;
    }
    public void setU_weixin(String u_weixin) {
        this.u_weixin = u_weixin;
    }
    public String getU_email() {
        return u_email;
    }
    public void setU_email(String u_email) {
        this.u_email = u_email;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getU_idcard() {
        return u_idcard;
    }
    public void setU_idcard(String u_idcard) {
        this.u_idcard = u_idcard;
    }
    public Integer getStart() {
        return start;
    }
    public void setStart(Integer start) {
        this.start = start;
    }
    public Integer getRows() {
        return rows;
    }
    public void setRows(Integer rows) {
        this.rows = rows;
    }

}
