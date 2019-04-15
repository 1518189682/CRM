package com.junhuan.dao;

import com.junhuan.po.Jobs;

import java.util.List;


public interface JobsDao {
	public List<Jobs> selectalljobsList();
	public Jobs selectjobsbyid(Integer id);
	public int createjobs(Jobs job);
	public int deleteJobs(Integer id);
	public Jobs getJobsById(Integer id);
	public int updateJobs(Jobs jobs2);
}
