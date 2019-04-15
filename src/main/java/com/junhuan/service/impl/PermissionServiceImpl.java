package com.junhuan.service.impl;

import java.util.List;

import com.junhuan.po.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.junhuan.dao.PermissionDao;
import com.junhuan.service.PermissionService;
@Service("PermissionService")
@Transactional
public class PermissionServiceImpl implements PermissionService {
	@Autowired
	private PermissionDao permissionDao;
	@Override
	public List<Permission> findPermissionname() {
		// TODO Auto-generated method stub
		return permissionDao.selectallPermissionList();
	}
	@Override
	public Permission findPermissionbyid(Integer id) {
		// TODO Auto-generated method stub
		return permissionDao.selectPermissionbyid(id);
	}


}
