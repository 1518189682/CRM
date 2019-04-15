package com.junhuan.service.impl;

import java.util.List;

import com.junhuan.po.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.junhuan.dao.DepartmentDao;
import com.junhuan.service.DepartmentService;
@Service("DepartmentService")
@Transactional
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;
	@Override
	public List<Department> findalldepartment() {
		// TODO Auto-generated method stub
		return departmentDao.selectalldepartmentList();
	}
	@Override
	public Department finddepartmentbyid(Integer id) {
		// TODO Auto-generated method stub
		return departmentDao.selectDepartmentbyid(id);
	}
	@Override
	public Department getDepartmentById(Integer id) {
		// TODO Auto-generated method stub
		return departmentDao.getDepartmentById(id);
	}
	@Override
	public int updateDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentDao.updateDepartment(department);
	}
	@Override
	public int deleteDepartment(Integer id) {
		// TODO Auto-generated method stub
		return departmentDao.deleteDepartment(id);
	}
	@Override
	public int createDepartment(Department department) {
		// TODO Auto-generated method stub
		return departmentDao.createDepartment(department);
	}

}
