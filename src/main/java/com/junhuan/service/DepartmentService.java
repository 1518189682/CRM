package com.junhuan.service;

import com.junhuan.po.Department;

import java.util.List;

public interface DepartmentService {
	public List<Department> findalldepartment();
	public Department finddepartmentbyid(Integer id);
	public Department getDepartmentById(Integer id);
	public int updateDepartment(Department department);
	public int deleteDepartment(Integer id);
	public int createDepartment(Department department);	
}
