package com.tumbler.manager.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.common.PageDTO;
import com.tumbler.manager.faq.service.ManagerFaqService;
import com.tumbler.manager.faq.vo.ManagerFaqVO;

@Controller
@RequestMapping(value="/manager/faq")
public class ManagerFaqContoller {
	@Autowired
	ManagerFaqService service;
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView managerFaqList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("faqList", service.mFaqList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mFaqTotal()));
		mav.setViewName("manager/faq/faqList");
		
		return mav;
	}
	
	@RequestMapping(value="/listWithPaging", method=RequestMethod.POST)
	public ModelAndView managerFaqListWithPaging(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		if (cri.getSearch_keyword().equals("")) {
			mav.addObject("faqList", service.mFaqList(cri));
			mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		} else {
			if ((cri.getPageNum()+"").equals("")) {
				cri.setPageNum(1); cri.setAmount(6);
			}
			mav.addObject("faqList", service.mFaqSearch(cri));
			mav.addObject("pageMaker", new PageDTO(cri, service.mFaqSearchedTotal(cri)));
		}
		
		mav.setViewName("manager/faq/faqList");
		
		return mav;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView managerFaqRegist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/faq/registFaq");
		return mav;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ModelAndView managerFaqInsert(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();

		service.mFaqInsert(fvo);
		
		mav.addObject("faqList", service.mFaqList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mFaqTotal()));
		mav.setViewName("manager/faq/faqList");
		
		return mav;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ModelAndView managerFaqDetail(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(fvo.getPageNum());
		cri.setAmount(fvo.getAmount());
		List<ManagerFaqVO> replies = service.mFaqReplyList(fvo.getF_num());
		
		service.mFaqCount(fvo.getF_num());
		
		mav.addObject("faqDetail", service.mFaqDetail(fvo.getF_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		if (replies.size() != 0) {
			mav.addObject("faqReplyList", replies);
		}
		mav.setViewName("manager/faq/faqDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView managerFaqDelete(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(fvo.getPageNum());
		cri.setAmount(fvo.getAmount());
		
		service.mFaqReplyDeleteAll(fvo.getF_num());
		service.mFaqDelete(fvo.getF_num());
		
		mav.addObject("faqList", service.mFaqList(cri));
		mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		mav.setViewName("manager/faq/faqList");
		
		return mav;
	}
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public ModelAndView managerFaqReply(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(fvo.getPageNum());
		cri.setAmount(fvo.getAmount());
		
		service.mFaqReply(fvo);
		
		List<ManagerFaqVO> replies = service.mFaqReplyList(fvo.getF_num());
		
		mav.addObject("faqDetail", service.mFaqDetail(fvo.getF_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		if (replies.size() != 0) {
			mav.addObject("faqReplyList", replies);
		}
		mav.setViewName("manager/faq/faqDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/replyEdit", method=RequestMethod.POST)
	public ModelAndView managerFaqReplyEdit(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(fvo.getF_num());
		cri.setAmount(fvo.getAmount());
		
		service.mFaqReplyEdit(fvo);
		
		List<ManagerFaqVO> replies = service.mFaqReplyList(fvo.getF_num());
		
		mav.addObject("faqDetail", service.mFaqDetail(fvo.getF_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		if (replies.size() != 0) {
			mav.addObject("faqReplyList", replies);
		}
		mav.setViewName("manager/faq/faqDetail");
		
		return mav;		
	}
	
	@RequestMapping(value="/replyDelete", method=RequestMethod.POST)
	public ModelAndView managerFaqReplyDelete(@RequestBody ManagerFaqVO fvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(fvo.getF_num());
		cri.setAmount(fvo.getAmount());
		
		service.mFaqReplyDelete(fvo.getFr_num());
		
		List<ManagerFaqVO> replies =  service.mFaqReplyList(fvo.getF_num());
		
		mav.addObject("faqDetail", service.mFaqDetail(fvo.getF_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mFaqTotal()));
		if (replies.size() != 0) {
			mav.addObject("faqReplyList", replies);
		}
		mav.setViewName("manager/faq/faqDetail");
		
		return mav;
	}
}
