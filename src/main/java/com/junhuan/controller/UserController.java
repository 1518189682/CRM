package com.junhuan.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.junhuan.po.Module;
import com.junhuan.po.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.junhuan.service.UserService;
//lly
@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/index.action", method = RequestMethod.GET)
	public String index(HttpSession session,Model model) {
		Staff staff = (Staff) session.getAttribute("LOGIN");
		model.addAttribute("u", staff);
		return "first";
	}
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String username, String password, HttpSession session,Model model) {
		try {
		Staff staff = userService.findStaff(username);
		if (staff.getPassword().equals(password)) {
			session.setAttribute("LOGIN", staff);
			return "redirect:/manage.action";
		}else {
			model.addAttribute("msg", "密码输入错误");
			return "login";
		}
		}catch(Exception e) {
			model.addAttribute("msg", "账号输入有误/账号不存在");
			return "login";
		}
	}
	@RequestMapping(value = "/manage.action", method = RequestMethod.GET)
	public String manage(Model model,HttpSession session) {
		Staff staff = (Staff) session.getAttribute("LOGIN");
			List<Module> modules=userService.findModule(staff.getPermission().getId());
			model.addAttribute("modules", modules);
			model.addAttribute("staff", staff);
			return "index";
	}
	@RequestMapping(value="logout.action")
	public String logout(HttpSession session,Model model) {
	    System.out.println("退出了!");
		session.invalidate();
		model.addAttribute("msg", "您已退出登陆！");
		return "login";
	}
	@RequestMapping(value="test.action")
	public String test() {
		return "index";
	}
}
