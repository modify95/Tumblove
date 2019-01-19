package com.tumbler.manager.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.common.PageDTO;
import com.tumbler.manager.qna.service.ManagerQnaService;
import com.tumbler.manager.qna.vo.ManagerQnaVO;

@Controller
@RequestMapping(value="/manager/qna")
public class ManagerQnaController {
	@Autowired
	private ManagerQnaService service;
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView managerQnaList() {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("qnaNoticeList", service.mQnaNoticeList());
		mav.addObject("qnaList", service.mQnaList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mQnaTotal()));

		mav.setViewName("manager/qna/qnaList");
		
		return mav;
	}
	
	@RequestMapping(value="/listWithPaging", method=RequestMethod.POST)
	public ModelAndView managerQnaListWithPaging(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("qnaNoticeList", service.mQnaNoticeList());
	
		if (cri.getSearch_keyword().equals("")) {
			mav.addObject("qnaList", service.mQnaList(cri));
			mav.addObject("pageMaker", new PageDTO(cri, service.mQnaTotal()));
		} else {	
			if ((cri.getPageNum()+"").equals("")) { 
				cri.setPageNum(1); cri.setAmount(6);
			}
			int searchedTotal = service.mQnaSearchedTotal(cri);
			cri.setSearched_total(searchedTotal);
			mav.addObject("qnaList", service.mQnaSearch(cri));
			mav.addObject("pageMaker", new PageDTO(cri, searchedTotal));
		}
		
		mav.setViewName("manager/qna/qnaList");
		
		return mav;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView managerRegistQna() {
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("manager/qna/registQna");
		
		return mav;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ModelAndView managerInsertQna(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		
		service.mQnaRegist(qvo);
		
		mav.addObject("qnaNoticeList", service.mQnaNoticeList());
		mav.addObject("qnaList", service.mQnaList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mQnaTotal()));
		
		mav.setViewName("manager/qna/qnaList");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeDetail", method=RequestMethod.POST)
	public ModelAndView managerQnaNoticeDetail(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		service.mQnaCount(qvo.getQ_num());
		
		mav.addObject("noticeDetail", service.mQnaNoticeDetail(qvo.getQ_num()));
		mav.setViewName("manager/qna/qnaDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public ModelAndView managerQnaNoticeDelete(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		
		service.mQnaDelete(qvo.getQ_num());
		
		mav.addObject("qnaNoticeList", service.mQnaNoticeList());
		mav.addObject("qnaList", service.mQnaList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mQnaTotal()));
		
		mav.setViewName("manager/qna/qnaList");
		return mav;
	}
	
	@RequestMapping(value="/qnaDetail", method=RequestMethod.POST)
	public ModelAndView managerQnaDetail(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(qvo.getPageNum());
		cri.setAmount(qvo.getAmount());
		
		service.mQnaCount(qvo.getQ_num());
		
		mav.addObject("qnaDetail", service.mQnaDetail(qvo.getQ_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mQnaTotal()));
		
		if (service.mQnaReplyList(qvo.getQ_num()).size() != 0) {
			mav.addObject("qnaReplyList", service.mQnaReplyList(qvo.getQ_num()));
		}
		
		mav.setViewName("manager/qna/qnaDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public ModelAndView managerQnaReply(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(qvo.getPageNum());
		cri.setAmount(qvo.getAmount());
		
		service.mQnaReply(qvo);
		
		mav.addObject("qnaDetail", service.mQnaDetail(qvo.getQ_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mQnaTotal()));
		
		if (service.mQnaReplyList(qvo.getQ_num()).size() != 0) {
			mav.addObject("qnaReplyList", service.mQnaReplyList(qvo.getQ_num()));
		}
		
		mav.setViewName("manager/qna/qnaDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/replyEdit", method=RequestMethod.POST)
	public ModelAndView managerQnaReplyEdit(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(qvo.getPageNum());
		cri.setAmount(qvo.getAmount());
		
		service.mQnaReplyEdit(qvo);
		
		mav.addObject("qnaDetail", service.mQnaDetail(qvo.getQ_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mQnaTotal()));
		
		if (service.mQnaReplyList(qvo.getQ_num()).size() != 0) {
			mav.addObject("qnaReplyList", service.mQnaReplyList(qvo.getQ_num()));
		}
		
		mav.setViewName("manager/qna/qnaDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/replyDelete", method=RequestMethod.POST)
	public ModelAndView managerQnaReplyDelete(@RequestBody ManagerQnaVO qvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(qvo.getPageNum());
		cri.setAmount(qvo.getAmount());
		
		service.mQnaReplyDelete(qvo.getQr_num());
		
		mav.addObject("qnaDetail", service.mQnaDetail(qvo.getQ_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mQnaTotal()));
		
		if (service.mQnaReplyList(qvo.getQ_num()).size() != 0) {
			mav.addObject("qnaReplyList", service.mQnaReplyList(qvo.getQ_num()));
		}
		
		mav.setViewName("manager/qna/qnaDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeAll", method=RequestMethod.POST)
	public ModelAndView managerQnaNoticeAll(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaNoticeList", service.mQnaNoticeSearch());
		mav.setViewName("manager/qna/qnaList");
		return mav;
	}
}
