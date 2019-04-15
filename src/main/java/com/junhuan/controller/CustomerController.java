package com.junhuan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
/**
 * 第一页从0-4，
 * 第二页从5-9
 */
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.junhuan.po.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.support.json.JSONUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.junhuan.service.CustomerService;
import com.junhuan.utils.MyPageInfo;
@Controller
public class CustomerController {

	private CustomerService customerService;

	private MyPageInfo page = new MyPageInfo();
	public CustomerService getCustomerService() {
		return customerService;
	}
	@Autowired
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	//分页显示客户信息
	@RequestMapping("/customerController/showCustomer.action")
    public String showCustomer(@RequestParam(defaultValue="1")Integer currentPage,Model model){
		
        List<Customer> customer = customerService.selectAll();
        //总数
        int countSize = customer.size();
        //总页数
        int totalPage = countSize%page.getPageSize()>0?countSize/page.getPageSize()+1:countSize/page.getPageSize();
        
        page.setTotalPage(totalPage);
        page.setCurrentPage(currentPage);
        //数据库的limit中的第一个参数
        int currentResult = page.getPageSize()*(page.getCurrentPage()-1);
        page.setCurrentResult(currentResult);
        //分页查询
        List<Customer> customersList = customerService.selForPage(page);
        model.addAttribute("customersList", customersList);
        model.addAttribute("page",page);
        return "customer";
    }
	//添加客户信息
	@RequestMapping("/customerController/addCustomer.action")
	public String addCustomer(Model model,Customer customer) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(new Date());
		Date d = sdf.parse(day);
		customer.setDate(d);
		customer.setDateChange(day);
		System.out.println("日期："+day+"日期2："+new Date());
		customerService.addCustomer(customer);
		return "redirect:showCustomer.action?currentPage=1";
	}
	//分页查询客户信息
	@RequestMapping("/customerController/showFindCustomer.action")
	public String showFindCustomer(ModelMap map,@RequestParam(defaultValue="1",required=true,value="currentPage") Integer currentPage,HttpServletRequest req,HttpServletResponse resp) throws Exception {
		Customer cus = new Customer();
		String name = req.getParameter("cname");
        if(!name.equals("")||name!=null) {
        	 //解决乱码问题
        	 cus.setName(name);
        }
        String sex = req.getParameter("sex");
        if(!sex.equals("")||sex!=null) {
        	 //解决乱码问题
       	 	 cus.setSex(sex);
        }
        String phone = req.getParameter("phone");
        if(!phone.equals("")||phone!=null) {
        	 //解决乱码问题
       	 	 cus.setPhone(phone);
        }
        String wxh = req.getParameter("wxh");
        if(!wxh.equals("")||wxh!=null) {
        	 //解决乱码问题
       	 	 cus.setWeixin(wxh);
        }
        String dateChangeStr = req.getParameter("test1");
        if(!dateChangeStr.equals("")||dateChangeStr!=null) {
        	cus.setDateChange(dateChangeStr);
        }
       // new SimpleDateFormat("yyyy-MM-dd").format(customer.getDate())日期轉string;
		List<Customer> customer = customerService.selByTerm(cus);
		System.out.println("模糊查询出来的总个数:"+customer.size());
        //根据条件分页模糊查询
        final int pageSize = 10;
        PageHelper.startPage(currentPage,pageSize);
        List<Customer> customersList = customerService.selByTerm(cus);
        PageInfo<Customer> pageInfo=new PageInfo<Customer>(customersList);
        map.addAttribute("pageInfo", pageInfo);
        map.addAttribute("cus", cus);
        System.out.println("分页模糊查询大小+++++："+pageInfo.getPages());
		return "customerfind";
	}
	//根据id查询客户信息
	@RequestMapping(value="/customerController/selById.action",method=RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody
	public void selById(HttpServletResponse response, @RequestParam Integer id) throws Exception {
		Customer customer = customerService.selById(id);
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", customer.getId()+"");
		map.put("name", customer.getName());//传回前台的数据
		map.put("sex", customer.getSex());//传回前台的数据
		map.put("phone", customer.getPhone());
		map.put("email", customer.getEmail());
		map.put("idCard", customer.getIdCard());
		map.put("weixin", customer.getWeixin());
		map.put("date", new SimpleDateFormat("yyyy-MM-dd").format(customer.getDate()));
		System.out.println(JSONUtils.toJSONString(map));
		response.setContentType("text/html;charset=UTF-8");  
	    response.getWriter().print(JSONUtils.toJSONString(map));  
	}
	//修改客户信息
	@RequestMapping("/customerController/updateCustomer.action")
	public String updateCustomer(Model model,Customer customer,HttpServletRequest req,HttpServletResponse resp) throws Exception {
		String dateStr = req.getParameter("date3");
		System.out.println("id:"+customer.getId());
		customer.setDate(new SimpleDateFormat("yyyy-MM-dd").parse(dateStr));
		//當前日期為最新修改日期
		customer.setDateChange(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		int a = customerService.updateCustomer(customer);
		System.out.println("影响的条数"+a);
		return "redirect:showCustomer.action?currentPage=1";
	}
	//单个删除
	@RequestMapping("/customerController/delCustomer.action")
	@ResponseBody
	public void delCustomer(@RequestParam int id,HttpServletResponse response) throws Exception {
		int[] arr = new int[customerService.selectAll().size()];
		arr[0] = id;
		System.out.println("删除的id为："+arr[0]);
		int a = customerService.delCustomer(arr);
		response.setContentType("text/html;charset=UTF-8"); 
		if(a>0) {
			response.getWriter().print(JSONUtils.toJSONString("删除成功！"));
		}else {
			response.getWriter().print(JSONUtils.toJSONString("删除失败！"));
		}
	}
}
