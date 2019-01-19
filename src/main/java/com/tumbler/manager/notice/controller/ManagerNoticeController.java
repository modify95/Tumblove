package com.tumbler.manager.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.common.PageDTO;
import com.tumbler.manager.notice.service.ManagerNoticeService;
import com.tumbler.manager.notice.vo.ManagerNoticeVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager/notice")
public class ManagerNoticeController {
	@Autowired
	private ManagerNoticeService managerNoticeService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView managerRegistNoice() {
		log.info("manager registNoice 호출 성공");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/notice/registNotice");
		mav.addObject("board");
		return mav;
	}
	
	//공지사항 리스트 구현
	@RequestMapping(value="/list", method = RequestMethod.POST)
	public String noticeList (@ModelAttribute Criteria cri, Model model) {
		log.info("noticeList 호출 성공");
		
			List<ManagerNoticeVO> noticeList = managerNoticeService.noticeList(cri);
			
			int total = managerNoticeService.mNoticeTotal(cri);
			
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "manager/notice/noticeList";
	}	
	
	@RequestMapping(value="/listWithPaging", method = RequestMethod.POST)
	public ModelAndView noticeListWithPaging (@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		if (cri.getSearch_keyword().equals("")) {
		
			List<ManagerNoticeVO> noticeList = managerNoticeService.noticeList(cri);
			
			int total = managerNoticeService.mNoticeTotal(cri);
			mav.addObject("noticeList", noticeList);
			mav.addObject("pageMaker", new PageDTO(cri, total));
		} else {
			mav.addObject("noticeList", managerNoticeService.mNoticeSearch(cri));
			mav.addObject("pageMaker", new PageDTO(cri, managerNoticeService.mNoticeSearchCount(cri)));
		}
		mav.setViewName("manager/notice/noticeList");
		
		return mav;
	}	
	
	//공지사항 등록 구현
	@RequestMapping(value="/noticeInsert", method = RequestMethod.POST)
	public String noticeInsert (@RequestBody ManagerNoticeVO nvo, Model model) {
		log.info("noticeInsert 호출 성공");
	
		int result =  managerNoticeService.noticeInsert(nvo);
		Criteria cri = new Criteria();
		
		
		List<ManagerNoticeVO> noticeList = managerNoticeService.noticeList(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", new PageDTO(cri, managerNoticeService.mNoticeTotal(cri)));
		model.addAttribute("data", nvo);
		
		return "manager/notice/noticeList";
	}
	
	@RequestMapping(value="/noticeDetail", method= RequestMethod.POST)
	public String noticeDetail(@RequestBody ManagerNoticeVO nvo, Model model) {
		log.info("noticeDetail 호출 성공");
		
		ManagerNoticeVO detail = new ManagerNoticeVO();
		
		detail = managerNoticeService.noticeDetail(nvo);
		
		Criteria cri = new Criteria();
		cri.setPageNum(nvo.getPageNum());
		cri.setAmount(nvo.getAmount());
		
		int total = managerNoticeService.mNoticeTotal(cri);
		
		managerNoticeService.noticeCnt(nvo.getN_num());
		
		model.addAttribute("detail",detail);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		return "manager/notice/noticeDetail";
	}
	

	
	@RequestMapping(value="/noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(@RequestBody ManagerNoticeVO nvo, Model model, Criteria cri) {
		log.info("noticeDelete 호출 성공");
		
		int result = managerNoticeService.noticeDelete(nvo.getN_num());
		
		List<ManagerNoticeVO> noticeList = managerNoticeService.noticeList(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data", nvo);
		
		return "manager/notice/noticeList";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView managerNoticeSearch(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		if ((cri.getPageNum()+"").equals("")) {
			cri.setPageNum(1);
			cri.setAmount(6);
		}
		mav.addObject("noticeList", managerNoticeService.mNoticeSearch(cri));
		mav.addObject("pageMaker", new PageDTO(cri, managerNoticeService.mNoticeSearchCount(cri)));
		mav.setViewName("manager/notice/noticeList");
		
		return mav;
	}
}
