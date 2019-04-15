package com.junhuan.dao;

import java.util.List;

import com.junhuan.po.Customer;
import com.junhuan.utils.MyPageInfo;

public interface CustomerMapper {

	//查詢所有客户信息
	List<Customer> queryAll();
	
	//分页显示客户信息
	List<Customer> selForPage(MyPageInfo page);
	
	//添加客户
	int addCustomer(Customer customer);
	
	//条件查询所有客户信息
	List<Customer> selByTerm(Customer customer);
	
	//根据id查询对应客户
	Customer selById(Integer id);
	
	//修改用户信息
	int updateCustomer(Customer customer);
	
	//删除用户信息
	int delCustomer(int[] id);
}
