package com.junhuan.service;

import com.junhuan.po.Module;
import com.junhuan.po.Staff;

import java.util.List;

public interface UserService {
	public Staff findStaff(String username);

	public List<Module> findModule(int permission_id);
}
