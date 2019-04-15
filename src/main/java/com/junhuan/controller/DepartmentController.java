package com.junhuan.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

import com.junhuan.po.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junhuan.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	//部门列表
	@RequestMapping(value="/department/list.action")
	public String list(Model model) throws UnsupportedEncodingException {
		// 条件查询所有部门
		List<Department> departmentlist=departmentService.findalldepartment();
		model.addAttribute("list", departmentlist);
		return "department";
	}
	//create department
	@RequestMapping("/department/create.action")
	@ResponseBody
	public String departmentcreate(String addDepartment_no,String addDepartment_name,String addDepartment_num )throws ParseException {
		Department department=new Department();
		department.setD_no(addDepartment_no);
		department.setD_name(addDepartment_name);
		department.setD_number(addDepartment_num);
		// 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = departmentService.createDepartment(department);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	 
	}
	//delete department
	@RequestMapping("/department/delete.action")
	@ResponseBody
	public String departmentDelete(Integer id) {
	    int rows = departmentService.deleteDepartment(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
	//update department
	/**
	 * 通过id获取部门信息
	 */
	@RequestMapping("/department/getDepartmentById.action")
	@ResponseBody
	public Department getDepartmentById(Integer id) {
		Department department = departmentService.getDepartmentById(id);
	    return department;
	}
	/**
	 * 更新部门
	 */
	@RequestMapping("/department/update.action")
	@ResponseBody
	public String departmentUpdate(Integer update_id,String update_no,String update_name,String update_num) {
		
		Department de=new Department();
		de.setId(update_id);
		de.setD_no(update_no);
		de.setD_name(update_name);
		de.setD_number(update_num);
		System.out.println(update_id+update_no+update_name+update_num);
	    int rows = departmentService.updateDepartment(de);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
}
