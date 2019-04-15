package com.junhuan.service.impl;

import java.util.List;

import com.junhuan.po.Module;
import com.junhuan.po.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junhuan.dao.UserDao;
import com.junhuan.service.UserService;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public Staff findStaff(String username) {
		System.out.println(userDao.findStaff(username).getU_name());
		return userDao.findStaff(username);
	}

	@Override
	public List<Module> findModule(int permission_id) {
		return userDao.findModule(permission_id);
	}
}
