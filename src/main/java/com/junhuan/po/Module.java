package com.junhuan.po;

import java.io.Serializable;

public class Module implements Serializable{
    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private int id;//数据库id
    private String name;
    private String url;
    private Permission permission;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public Permission getPermission() {
        return permission;
    }
    public void setPermission(Permission permission) {
        this.permission = permission;
    }

}