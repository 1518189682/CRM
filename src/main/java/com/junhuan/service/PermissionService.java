package com.junhuan.service;

import com.junhuan.po.Permission;

import java.util.List;

public interface PermissionService {
	public List<Permission> findPermissionname();
	public Permission findPermissionbyid(Integer id);	
}

