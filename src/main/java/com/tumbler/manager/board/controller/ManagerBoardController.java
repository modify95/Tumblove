package com.tumbler.manager.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/manager/board")
public class ManagerBoardController {
	@RequestMapping(value="/main")
	public String managerBoard() {
		return "manager/board/managerBoard";
	}
}
