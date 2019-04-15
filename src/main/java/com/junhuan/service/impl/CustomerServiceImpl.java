package com.junhuan.service.impl;

import java.util.List;

import com.junhuan.po.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.junhuan.dao.CustomerMapper;
import com.junhuan.service.CustomerService;
import com.junhuan.utils.MyPageInfo;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	private CustomerMapper customerMapper;
	
	public CustomerMapper getCustomerMapper() {
		return customerMapper;
	}

	@Autowired
	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}

	@Override
	public List<Customer> selectAll() {
		// TODO Auto-generated method stub
		return customerMapper.queryAll();
	}
	@Override
	public List<Customer> selForPage(MyPageInfo page) {
		// TODO Auto-generated method stub
		return customerMapper.selForPage(page);
	}

	@Override
	public int addCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.addCustomer(customer);
	}

	@Override
	public List<Customer> selByTerm(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.selByTerm(customer);
	}

	@Override
	public Customer selById(Integer id) {
		// TODO Auto-generated method stub
		return customerMapper.selById(id);
	}

	@Override
	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerMapper.updateCustomer(customer);
	}

	@Override
	public int delCustomer(int[] id) {
		// TODO Auto-generated method stub
		return customerMapper.delCustomer(id);
	}

}
