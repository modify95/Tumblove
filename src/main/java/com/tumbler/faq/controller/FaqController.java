package com.tumbler.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.client.page.Criteria;
import com.tumbler.client.page.PageDTO;
import com.tumbler.faq.service.FaqService;
import com.tumbler.faq.vo.FaqVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value="/faq")
@Log
public class FaqController {
	@Autowired
	private FaqService faqService;
	
	/*자주묻는질문 리스트 구현*/
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public String faqList(@ModelAttribute FaqVO fav, Criteria cri, Model model) {
		log.info("faqList 호출성공");
		
		List<FaqVO> faqList = null;
		int total = faqService.cFaqTotal();
		
		if(cri == null) {
			faqList = faqService.cFaqList(new Criteria());
			model.addAttribute("pageMaker", new PageDTO(total, new Criteria()));
		}else {
			faqList = faqService.cFaqList(cri);
			model.addAttribute("pageMaker", new PageDTO(total, cri));
		}
		System.out.println(faqList.get(0).getF_num());
		model.addAttribute("faqList", faqList);
		model.addAttribute("data", fav);
		return "faq/faqList";
	}
	
	/*자주묻는질문 상세내용 구현*/
	@RequestMapping(value = "/faqDetail.do", method= RequestMethod.GET)
	public String faqDetail(@ModelAttribute FaqVO fvo, Model model) {
		log.info("faq Detail 호출 성공");
		
		FaqVO detail = new FaqVO();
		detail = faqService.cFaqDetail(fvo);
		
		if(detail != null && (!detail.equals(""))) {
			detail.setF_content(detail.getF_content().toString().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("detail", detail);
		
		return "faq/faqDetail";
		
	}
	
	//검색 후 페이지 구현
	@RequestMapping(value = "/search", method = RequestMethod.GET )
	public String faqSearchPaging(Criteria cri, Model model) {
		log.info("faqSearchpaging 호출성공");
		
		List<FaqVO> faqList = faqService.cFaqSearchPaging(cri);
		int total = faqService.cFaqSearchTotal(cri);
		
		model.addAttribute("faqList", faqList);
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		
		log.info("total: " + total);
		return "faq/faqList";
	}

}
