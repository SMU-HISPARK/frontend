package com.virtual_idol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class FrontController {

	@Autowired HttpSession session;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login_test() {
		session.setAttribute("session_id", "admin");
		session.setAttribute("session_name", "namee");
		return "index";
	}
	
	
	@PostMapping("/login")
	public String login(
			@RequestParam(name="redirectTo",required=false) String redirectURL
			) {
		session.setAttribute("session_id", "admin");
		session.setAttribute("session_name", "namee");
		
		// 로그인 요청이 들어온 페이지로 리다이렉트
		if(redirectURL != null) {
			return "redirect:"+redirectURL;
		}
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.invalidate();
		return "index";
	}
	
}
