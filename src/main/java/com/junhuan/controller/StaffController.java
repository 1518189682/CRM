package com.junhuan.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import com.junhuan.po.Department;
import com.junhuan.po.Jobs;
import com.junhuan.po.Permission;
import com.junhuan.po.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junhuan.dao.DepartmentDao;
import com.junhuan.dao.StaffDao;
import com.junhuan.service.DepartmentService;
import com.junhuan.service.JobsService;
import com.junhuan.service.PermissionService;
import com.junhuan.service.StaffService;
import com.junhuan.utils.Page;

import javax.servlet.http.HttpSession;

/**
 * 员工管理控制器类
 */
@Controller
public class StaffController {
	// 依赖注入
	@Autowired
	private StaffDao staffDao;
	@Autowired
	private DepartmentDao departmentDao;
	@Autowired
	private StaffService staffService;
	@Autowired
	private JobsService jobsService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private PermissionService permissionService;

	@RequestMapping(value = "/staff/find.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "15") Integer rows,
			String findstaff_name, String findstaff_phone,
			@RequestParam(defaultValue = "0") Integer findstaff_department, String findstaff_sex, Model model)
			throws IOException {
		if (findstaff_name != null) {
			findstaff_name = new String(findstaff_name.getBytes("iso-8859-1"), "utf-8");
		}
		if (findstaff_phone != null) {
			findstaff_phone = new String(findstaff_phone.getBytes("iso-8859-1"), "utf-8");
		}
		if (findstaff_sex != null) {
			findstaff_sex = new String(findstaff_sex.getBytes("iso-8859-1"), "utf-8");
		}
		List<Department> departmentlist = departmentService.findalldepartment();
		List<Jobs> jobslist = jobsService.findjobsname();
		List<Permission> permissionlist = permissionService.findPermissionname();
		Page<Staff> Staffs = staffService.findStaffList(page, rows, findstaff_name, findstaff_phone,
				findstaff_department == 0 ? null : departmentService.finddepartmentbyid(findstaff_department),
				findstaff_sex == null ? null : findstaff_sex.equals("0") ? null : findstaff_sex);
		model.addAttribute("page", Staffs);
		model.addAttribute("departmentlist", departmentlist);
		model.addAttribute("permissionlist", permissionlist);
		model.addAttribute("jobslist", jobslist);
		model.addAttribute("mainishidden", findstaff_sex==null ? "none":"");
		model.addAttribute("ishidden", findstaff_sex==null ? "":"none");
		return "staff";
	}

	/**
	 * 创建员工
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/staff/create.action")
	@ResponseBody
	public String staffCreate(String addstaff_name, String addstaff_sex, String addstaff_idcard, String addstaff_phone,
			String addstaff_weixin, String addstaff_email, String addstaff_username, String addstaff_password,
			int addstaff_jobs, int addstaff_department, int addstaff_permission, String addstaff_date)
			throws ParseException {
		if (isstaff(addstaff_username)) {
			return "existing";
		};
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(addstaff_date);
		Jobs job = jobsService.selectjobsbyid(addstaff_jobs);
		Department department = departmentService.finddepartmentbyid(addstaff_department);
		Permission permission = permissionService.findPermissionbyid(addstaff_permission);
		Staff staff = new Staff(addstaff_name, addstaff_sex, addstaff_idcard, addstaff_phone, addstaff_weixin,
				addstaff_email, addstaff_username, addstaff_password, job, department, permission, date);
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = staffService.createStaff(staff);
		if (rows > 0) {
			department.setD_number((Integer.parseInt(department.getD_number())+1)+"");
			departmentDao.updateDepartment(department);
			return "OK";
		} else {
			return "FAIL";
		}
	}

//	根据账号查找staff
	public boolean isstaff(String username) {
		for (Staff staff : staffDao.selectallstaffList()) {
			if (staff.getUsername().equals(username)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 删除员工
	 */
	@RequestMapping("/staff/delete.action")
	@ResponseBody
	public String staffDelete(Integer id) {
		int rows = staffService.deletestaff(id);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/**
	 * 通过id获取员工信息
	 */
	@RequestMapping("/staff/getstaffById.action")
	@ResponseBody
	public Staff getstaffById(Integer id) {
		Staff staff = staffService.getstaffById(id);
		return staff;
	}

	/**
	 * 更新员工
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/staff/update.action")
	@ResponseBody
	public String staffUpdate(int update_id, String update_name, String update_sex, String update_idcard,
			String update_phone, String update_weixin, String update_email, String update_username,
			String update_password, int update_jobs, int update_department, int update_permission, String update_date)
			throws ParseException {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(update_date);
		Jobs job = jobsService.selectjobsbyid(update_jobs);
		Department department = departmentService.finddepartmentbyid(update_department);
		Permission permission = permissionService.findPermissionbyid(update_permission);
		Staff staff = new Staff(update_name, update_sex, update_idcard, update_phone, update_weixin, update_email,
				update_username, update_password, job, department, permission, date);
		// System.out.println(update_name+" "+update_sex+" "+update_idcard+"
		// "+update_phone+" "+update_weixin+" "+update_email+" "+update_username+"
		// "+update_password+" "+job+" "+department+" "+permission+" "+date);
		staff.setId(update_id);
		int rows = staffService.updatestaff(staff);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}

	/* 个人信息 */
	@RequestMapping(value = "/staff/personinfo.action")
	public String personinfo(Model model, HttpSession session) {
		Staff staf = (Staff) session.getAttribute("LOGIN");
		Staff staff = staffDao.getstaffById(staf.getId());
		model.addAttribute("staff", staff);
		return "personinfo";
	}

	/**
	 * 个人修改
	 * 
	 * @throws ParseException
	 */
	@RequestMapping("/staff/updatepersoninfo.action")
	@ResponseBody
	public String staffpersoninfo(Integer person_id, String person_name, String person_sex, String person_idcard,
			String person_phone, String person_weixin, String person_email, String person_date) throws ParseException {
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(person_date);
		Staff staff = new Staff();
		staff.setId(person_id);
		staff.setDate(date);
		staff.setU_name(person_name);
		staff.setU_sex(person_sex);
		staff.setU_idcard(person_idcard);
		staff.setU_phone(person_phone);
		staff.setU_weixin(person_weixin);
		staff.setU_email(person_email);
		// 执行Service层中的创建方法，返回的是受影响的行数
		int rows = staffService.updatestaff(staff);
		if (rows > 0) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
}
