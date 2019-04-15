package com.junhuan.service.impl;
import java.util.List;

import com.junhuan.po.Department;
import com.junhuan.po.Staff;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.junhuan.dao.StaffDao;
import com.junhuan.service.StaffService;
import com.junhuan.utils.Page;
/**
 * 员工管理
 */
@Service("StaffService")
@Transactional
public class StaffServiceImpl implements StaffService {
	// 声明DAO属性并注入
	@Autowired
	private StaffDao staffDao;
	@Override
	public int createStaff(Staff staff) {
		// TODO Auto-generated method stub
		return staffDao.createstaff(staff);
	}
	@Override
	public int deletestaff(Integer id) {
		// TODO Auto-generated method stub
		return staffDao.deletestaff(id);
	}
	@Override
	public Staff getstaffById(Integer id) {
		// TODO Auto-generated method stub
		return staffDao.getstaffById(id);
	}
	@Override
	public int updatestaff(Staff staff) {
		// TODO Auto-generated method stub
		return staffDao.updatestaff(staff);
	}
	@Override
	public Page<Staff> findStaffList(Integer page, Integer rows, String u_name, String u_phone, Department department,
			String u_sex) {
		// TODO Auto-generated method stub
		// 创建员工对象
		Staff staff = new Staff();
		// 判断员工名称
		if(StringUtils.isNotBlank(u_name)){
			staff.setU_name(u_name);
		}
		// 判断员工信息来源
		if(StringUtils.isNotBlank(u_phone)){
			staff.setU_phone(u_phone);
		}
		// 判断员工所属行业
		if(department!=null){
			staff.setDepartment(department);
		}
		// 判断员工级别
		if(StringUtils.isNotBlank(u_sex)){
			staff.setU_sex(u_sex);
		}
		List<Staff> findstaffs = 
				staffDao.selectstaffList(staff);
		// 查询员工列表总记录数
				Integer count = findstaffs.size();
		// 当前页
		staff.setStart((page-1) * rows) ;
		// 每页数
		staff.setRows(rows);
		// 查询员工列表
		List<Staff> staffs = 
				staffDao.selectstaffList(staff);
		
		// 创建Page返回对象
		Page<Staff> result = new Page<>();
		result.setPage(page);
		result.setRows(staffs);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

}
