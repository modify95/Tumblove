package com.tumbler.manager.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.common.PageDTO;
import com.tumbler.manager.member.service.ManagerMemberService;
import com.tumbler.manager.member.vo.ManagerMemberVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager/member")
public class ManagerMemberController {
	@Autowired
	private ManagerMemberService memberService;
	
	//리스트
	@RequestMapping(value="/memberList" , method=RequestMethod.GET)
	public ModelAndView memberList(@ModelAttribute Criteria cri ) {
		List<ManagerMemberVO> memberList = memberService.memberList(cri);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList",memberList);
		int total = memberService.memberTotal(cri);
		mav.addObject("pageMaker",new PageDTO(cri, total));
		mav.setViewName("manager/member/memberList");
		
		
		return mav;
	}
	
	//페이징 및 검색
	@RequestMapping(value="/listPaging")
	public ModelAndView listPaging(Criteria cri) {
		ModelAndView mav = new ModelAndView();
		if (cri.getSearch_keyword().equals("")) {
			List<ManagerMemberVO> memberList = memberService.memberList(cri);
			mav.addObject("memberList",memberList);
			int total = memberService.memberTotal(cri);
			log.info("totla : " + total);
			mav.addObject("pageMaker",new PageDTO(cri, total ));
			mav.setViewName("manager/member/memberList");
		} else {
			
			List<ManagerMemberVO> searchedList = memberService.memberSearch(cri);
			mav.addObject("memberList",searchedList);
			mav.addObject("pageMaker",new PageDTO(cri, memberService.memberSearchedTotal(cri)));
			mav.setViewName("manager/member/memberList");
		}
		return mav;
	}
	//회원 정보 상세보기
	@RequestMapping(value="/memberDetail", method=RequestMethod.POST)
	public ModelAndView memberDetail(@RequestBody ManagerMemberVO mvo) {
		log.info("memberDetail 호출 성공");
		log.info("m_num = " + mvo.getM_num());
		
		ManagerMemberVO detail = memberService.memberDetail(mvo);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memberDetail",detail);
		Criteria cri = new Criteria();
		cri.setSearch_keyword(mvo.getSearch_keyword());
		cri.setSearch_option(mvo.getSearch_option());
		cri.setPageNum(mvo.getPageNum());
		cri.setAmount(mvo.getAmount());
		if (cri.getSearch_keyword().equals("")) {
			int total = memberService.memberTotal(cri);
			mav.addObject("pageMaker",new PageDTO(cri, total));
		} else {
			mav.addObject("pageMaker",new PageDTO(cri, memberService.memberSearchedTotal(cri)));
		}
		
		mav.setViewName("manager/member/memberDetail");
		
		
		return mav;
		
	}
	
}
