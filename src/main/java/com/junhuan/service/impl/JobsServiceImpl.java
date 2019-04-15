package com.junhuan.service.impl;

import com.junhuan.dao.JobsDao;
import com.junhuan.po.Jobs;
import com.junhuan.service.JobsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Author:  lly
 * Date:    2019/4/3 17:37
 * Description:
 */
@Service("JobsService")
@Transactional
public class JobsServiceImpl implements JobsService {
    @Autowired
    private JobsDao jobsDao;
    @Override
    public List<Jobs> findjobsname() {
        // TODO Auto-generated method stub
        List<Jobs> li=jobsDao.selectalljobsList();
        return li;
    }
    @Override
    public Jobs selectjobsbyid(Integer id) {
        // TODO Auto-generated method stub
        return jobsDao.selectjobsbyid(id);
    }
    @Override
    public int createjobs(Jobs job) {
        // TODO Auto-generated method stub
        return jobsDao.createjobs(job);
    }
    @Override
    public int deleteJobs(Integer id) {
        // TODO Auto-generated method stub
        return jobsDao.deleteJobs(id);
    }
    @Override
    public Jobs getJobsById(Integer id) {
        // TODO Auto-generated method stub
        return jobsDao.getJobsById(id);
    }
    @Override
    public int updateJobs(Jobs jobs2) {
        // TODO Auto-generated method stub
        return jobsDao.updateJobs(jobs2);
    }

}
