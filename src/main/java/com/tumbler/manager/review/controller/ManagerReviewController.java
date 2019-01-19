package com.tumbler.manager.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.common.PageDTO;
import com.tumbler.manager.review.service.ManagerReviewService;
import com.tumbler.manager.review.vo.ManagerReviewVO;
import com.tumbler.util.ProductFileUploadUtil;

@Controller
@RequestMapping(value="/manager/review")
public class ManagerReviewController {
	@Autowired
	ManagerReviewService service;
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView managerReviewList() {
		ModelAndView mav = new ModelAndView();

		mav.addObject("reviewNoticeList", service.mReviewNoticeList());
		mav.addObject("reviewList", service.mReviewList(new Criteria()));
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mReviewTotal()));
		mav.setViewName("manager/review/reviewList");
		
		return mav;
	}
	
	@RequestMapping(value="/listWithPaging", method=RequestMethod.POST)
	public ModelAndView managerQnaListWithPaging(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("reviewNoticeList", service.mReviewNoticeList());
		
		if (cri.getSearch_keyword().equals("")) {
			mav.addObject("reviewList", service.mReviewList(cri));
			mav.addObject("pageMaker", new PageDTO(cri, service.mReviewTotal()));
		} else {
			if ((cri.getPageNum()+"").equals("")) {
				cri.setPageNum(1); cri.setAmount(6);
			}
			mav.addObject("reviewList", service.mReviewSearch(cri));
			mav.addObject("pageMaker", new PageDTO(cri, service.mReviewSearchedTotal(cri)));
		}
		
		mav.setViewName("manager/review/reviewList");
		
		return mav;
	}
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ModelAndView managerRegistReivew() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/review/registReview");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	public ModelAndView managerReivewNoticeInsert(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		service.mReviewNoticeInsert(rvo);
		
		mav.addObject("reviewNoticeList", service.mReviewNoticeList());
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mReviewTotal()));
		mav.setViewName("manager/review/reviewList");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeDetail", method=RequestMethod.POST)
	public ModelAndView managerReviewNoticeDetail(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		
		service.mReviewCount(rvo.getR_num());
		
		mav.addObject("reviewNotice", service.mReviewNoticeDetail(rvo.getR_num()));
		mav.setViewName("manager/review/reviewDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public ModelAndView managerReivewNoticeDetail(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		
		service.mReviewNoticeDelete(rvo.getR_num());
		
		mav.addObject("reviewNoticeList", service.mReviewNoticeList());
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mReviewTotal()));
		mav.setViewName("manager/review/reviewList");
		
		return mav;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ModelAndView managerReviewDetail(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(rvo.getPageNum());
		cri.setAmount(rvo.getAmount());
		
		service.mReviewCount(rvo.getR_num());

		mav.addObject("review", service.mReviewDetail(rvo.getR_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mReviewTotal()));
		List<ManagerReviewVO> replies = service.mReviewReplyList();
		
		if (replies.size() != 0) {
			mav.addObject("reviewReplyList", replies);
		}
		
		mav.setViewName("manager/review/reviewDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public ModelAndView reviewInsert(ManagerReviewVO rvo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String image;
		try {
			image = ProductFileUploadUtil.fileUpload(rvo.getFile(), request, "product");
			rvo.setR_image(image);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
		service.mReviewInsert(rvo);
		mav.addObject("reviewNoticeList", service.mReviewNoticeList());
		mav.addObject("pageMaker", new PageDTO(new Criteria(), service.mReviewTotal()));
		mav.setViewName("manager/review/reviewList");
		return mav;
	}
	
	@RequestMapping(value="/reply", method=RequestMethod.POST)
	public ModelAndView mangerReviewReply(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(rvo.getPageNum());
		cri.setAmount(rvo.getAmount());
		
		service.mReviewReply(rvo);
		
		List<ManagerReviewVO> replies = service.mReviewReplyList();
		
		mav.addObject("review", service.mReviewDetail(rvo.getR_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mReviewTotal()));
		if (replies.size() != 0) {
			mav.addObject("reviewReplyList", replies);
		}
		mav.setViewName("manager/review/reviewDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/replyEdit", method=RequestMethod.POST)
	public ModelAndView managerReviewReplyEdit(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(rvo.getPageNum());
		cri.setAmount(rvo.getAmount());
		
		service.mReviewReplyEdit(rvo);
		
		mav.addObject("review", service.mReviewDetail(rvo.getR_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mReviewTotal()));
		List<ManagerReviewVO> replies = service.mReviewReplyList();
		if (replies.size() != 0) {
			mav.addObject("reviewReplyList", replies);
		}
		mav.setViewName("manager/review/reviewDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/replyDelete", method=RequestMethod.POST)
	public ModelAndView managerReviewReplyDelete(@RequestBody ManagerReviewVO rvo) {
		ModelAndView mav = new ModelAndView();
		Criteria cri = new Criteria();
		cri.setPageNum(rvo.getPageNum());
		cri.setAmount(rvo.getAmount());
		
		service.mReviewReplyDelete(rvo.getRr_num());
		
		mav.addObject("review", service.mReviewDetail(rvo.getR_num()));
		mav.addObject("pageMaker", new PageDTO(cri, service.mReviewTotal()));
		List<ManagerReviewVO> replies = service.mReviewReplyList();
		if (replies.size() != 0) {
			mav.addObject("reviewReplyList", replies);
		}
		mav.setViewName("manager/review/reviewDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeAll", method=RequestMethod.POST)
	public ModelAndView managerReviewNoticeAll(@RequestBody Criteria cri) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("reviewNoticeList", service.mReviewNoticeSearch());
		mav.setViewName("manager/review/reviewList");
		return mav;
	}
}
