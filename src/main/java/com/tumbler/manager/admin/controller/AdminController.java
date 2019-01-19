package com.tumbler.manager.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.manager.admin.service.AdminService;
import com.tumbler.manager.admin.vo.AdminVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager/admin")
public class AdminController {	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ResponseEntity<String> login(@RequestBody AdminVO avo, Model model, HttpServletRequest request) {
		log.info("managerLogin 호출 성공");
		ResponseEntity<String> entity = null;
		try {
			List<AdminVO> admin = adminService.managerLogin(avo);
			if (!admin.isEmpty()) {
				entity = new ResponseEntity<String> ("SUCCESS", HttpStatus.OK);
				HttpSession session = request.getSession(false);
				session.setMaxInactiveInterval(60*60*24);
				session.setAttribute("a_num", admin.get(0).getA_num());
				session.setAttribute("a_id", admin.get(0).getA_id());
				session.setAttribute("a_name", admin.get(0).getA_name());
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String> (e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		log.info("managerLogout 호출 성공");
		
		return "manager/admin/logout";
	}
}
