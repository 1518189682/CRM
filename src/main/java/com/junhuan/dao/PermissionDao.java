package com.junhuan.dao;

import com.junhuan.po.Permission;

import java.util.List;

public interface PermissionDao {
	public List<Permission> selectallPermissionList();
	public Permission selectPermissionbyid(Integer id);
}
