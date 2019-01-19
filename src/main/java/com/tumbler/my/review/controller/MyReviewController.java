package com.tumbler.my.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.my.review.service.MyReviewServiceImpl;
import com.tumbler.review.file.FileUploadUtil;
import com.tumbler.review.vo.ReviewVO;

@Controller
@RequestMapping("/myreview")
public class MyReviewController {

	@Autowired
	private MyReviewServiceImpl service;

	@RequestMapping(value = "/myreviewlist", method = RequestMethod.GET)
	public String myreviewList(Model model, ReviewVO rvo, HttpSession session) {
		String id = (String) session.getAttribute("m_id");
		List<ReviewVO> list = service.myReviewList(id);

		model.addAttribute("list", list);
		return "review/myreviewList";
	}

	// 리뷰 수정
	@RequestMapping(value = "/myreviewUpdate", method = RequestMethod.POST)
	public String myreviewUpdate(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws Exception {
		System.out.println("내가쓴 리뷰 수정 호출 성공");
		String r_Image = "";
		if (!rvo.getFile().isEmpty()) {
			System.out.println("===========file=" + rvo.getFile().getOriginalFilename());
			if (!rvo.getR_image().isEmpty()) {
				FileUploadUtil.fileDelete(rvo.getR_image(), request);
			}
			r_Image = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
			rvo.setR_image(r_Image);
		}

		service.myReviewUpdate(rvo);

		return "redirect:/myreview/myreviewlist";

	}

	// 리뷰 삭제
	@RequestMapping(value = "/myreviewDelete", method = RequestMethod.POST)
	public String myreviewDelete(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws Exception {
		System.out.println("내가쓴 리뷰 삭제 호출 성공");
		if (rvo.getR_image() != "" && rvo.getR_image() != null) {
			FileUploadUtil.fileDelete(rvo.getR_image(), request);
		}

		service.myReviewDelete(rvo);

		return "redirect:/myreview/myreviewlist";
	}
}
