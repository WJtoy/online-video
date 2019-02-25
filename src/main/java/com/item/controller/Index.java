package com.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Index {
	
	@RequestMapping("/")
	public String index() {
		return "login";
	}
	
	
	@RequestMapping("/main")
	public String main() {
		return "view/main";
	}
	
	
	@RequestMapping("/view")
	public String view() {
		return "view/index";
	}
	
	@RequestMapping("/showuser")
	public String showuser() {
		return "xxs";
	}
	
	@RequestMapping("/ificationCourse")
	public String ificationCourse() {
		return "ificationCourse";
	}
	
	
	@RequestMapping("/receptionLogin")
	public String receptionLogin() {
		return "receptionLogin";
	}
	
	
	@RequestMapping("/register")
	public String sssd() {
		return "register";
	}
	

	@RequestMapping("/receptionUser")
	public String receptionUser() {
		return "receptionUser";
	}

}
