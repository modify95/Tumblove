package com.tumbler.manager.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/manager")
public class ManagerMainController {
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String managerMain(Model model) {
		
		return "intro2";
	}
}
