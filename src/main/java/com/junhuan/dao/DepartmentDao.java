package com.junhuan.dao;

import com.junhuan.po.Department;

import java.util.List;

public interface DepartmentDao {
	public List<Department> selectalldepartmentList();
	public Department selectDepartmentbyid(Integer id);
	public int createDepartment(Department department);
	public int deleteDepartment(Integer id);
	public int updateDepartment(Department department);
	public Department getDepartmentById(Integer id);
}
