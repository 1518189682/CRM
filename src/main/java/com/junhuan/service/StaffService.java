package com.junhuan.service;

import com.junhuan.po.Department;
import com.junhuan.po.Staff;
import com.junhuan.utils.Page;
public interface StaffService {
	// 员工列表
	public int createStaff(Staff staff);
	public int deletestaff(Integer id);
	public Staff getstaffById(Integer id);
	public int updatestaff(Staff staff);
	public Page<Staff> findStaffList(Integer page, Integer rows,
									 String u_name, String u_phone,
									 Department department, String u_sex);
}
