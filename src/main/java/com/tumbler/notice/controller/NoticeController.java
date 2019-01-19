package com.tumbler.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.client.page.Criteria;
import com.tumbler.client.page.PageDTO;
import com.tumbler.notice.service.NoticeService;
import com.tumbler.notice.vo.NoticeVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value="/notice")
@Log
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	/*공지사항 리스트 구현*/
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO nvo,Criteria cri, Model model) {
		log.info("noticeList 호출 성공");
		
		List<NoticeVO> noticeList = null;
		int total = noticeService.cNoticeTotal();
		
		if (cri == null) {
			noticeList = noticeService.cNoticeList(new Criteria());
			model.addAttribute("pageMaker", new PageDTO(total, new Criteria()));
		} else {
			noticeList = noticeService.cNoticeList(cri);
			model.addAttribute("pageMaker", new PageDTO(total, cri));
		}
		System.err.println(noticeList.get(0).getN_num());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("data", nvo);
		return "notice/noticeList";
	}
	
	
/*	공지사항 상세내용 구현*/
	@RequestMapping(value = "/noticeDetail", method= RequestMethod.GET)
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		log.info("notice Detail 호출 성공");
		
		NoticeVO detail = new NoticeVO();
		detail = noticeService.cNoticeDetail(nvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setN_content(detail.getN_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}
	//검색 후 페이지 구현
	@RequestMapping(value = "/noticeSearch", method = RequestMethod.GET)
	public String noticeSearchPaging(Criteria cri, Model model) {
		log.info("noticeSearchPaging 호출 성공");
		
		List<NoticeVO> noticeList = noticeService.cNoticeSearchPaging(cri);
		int total = noticeService.cNoticeSearchTotal(cri);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		log.info("total: " + total);
		return "notice/noticeList";
	}
}
