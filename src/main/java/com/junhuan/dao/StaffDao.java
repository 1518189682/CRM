package com.junhuan.dao;
import com.junhuan.po.Staff;

import java.util.List;

/**
 * 接口
 */
public interface StaffDao {
    // 员工列表
	public List<Staff> selectallstaffList();
	public int createstaff(Staff staff);
	public int deletestaff(Integer id);
	public Staff getstaffById(Integer id);
	public int updatestaff(Staff staff);
	public List<Staff> selectstaffList(Staff staff);
}
