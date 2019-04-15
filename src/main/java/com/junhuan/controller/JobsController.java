package com.junhuan.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;

import com.junhuan.po.Jobs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.junhuan.service.JobsService;

@Controller
public class JobsController {
	@Autowired
	private JobsService jobsService;
	//部门列表
	@RequestMapping(value="/jobs/list.action")
	public String list(Model model) throws UnsupportedEncodingException {
		// 条件查询所有部门
		List<Jobs> jobslist=jobsService.findjobsname();
		model.addAttribute("list", jobslist);
		return "jobs";
	}
	//create jobs
	@RequestMapping("/jobs/create.action")
	@ResponseBody
	public String jobscreate(String addj_no,String addj_name)throws ParseException {
		Jobs job=new Jobs();
		job.setJ_name(addj_name);
		job.setJ_no(addj_no);
		
		// 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = jobsService.createjobs(job);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	 
	}
	//delete department
		@RequestMapping("/jobs/delete.action")
		@ResponseBody
		public String jobsDelete(Integer id) {
		    int rows = jobsService.deleteJobs(id);
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
		@RequestMapping("/jobs/getJobsById.action")
		@ResponseBody
		public Jobs getJobsById(Integer id) {
			Jobs jobs1 = jobsService.getJobsById(id);
		    return jobs1;
		}
		/**
		 * 更新部门
		 */
		@RequestMapping("/jobs/update.action")
		@ResponseBody
		public String jobsUpdate(Integer update_id,String update_no,String update_name) {
			
			Jobs jobs2=new Jobs();
			jobs2.setId(update_id);
			jobs2.setJ_no(update_no);
			jobs2.setJ_name(update_name);
		    int rows = jobsService.updateJobs(jobs2);
		    if(rows > 0){
		        return "OK";
		    }else{
		        return "FAIL";
		    }
		}
}
