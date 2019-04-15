package com.junhuan.dao;

import java.util.List;

import com.junhuan.po.Module;
import com.junhuan.po.Staff;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
	public Staff findStaff(@Param("username") String username);

	public List<Module> findModule(@Param("permission_id") int permission_id);
}
