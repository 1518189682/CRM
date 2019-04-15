package com.junhuan.service;

import java.util.List;

import com.junhuan.po.Customer;
import com.junhuan.utils.MyPageInfo;

public interface CustomerService {

	//查詢所有客户
	List<Customer> selectAll();
	//分页显示客户
	List<Customer> selForPage(MyPageInfo page);
	//添加客户信息
	int addCustomer(Customer customer);
	//条件查询所有客户信息
	List<Customer> selByTerm(Customer customer);
	//根据id查询出对应客户信息
	Customer selById(Integer id);
	//修改客户信息
	int updateCustomer(Customer customer);
	//删除客户信息
	int delCustomer(int[] arr);
}
