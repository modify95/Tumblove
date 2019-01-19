package com.tumbler.main.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tumbler.product.serivice.ProductService;
import com.tumbler.product.vo.ProductVO;

import lombok.extern.java.Log;

@Controller
@SessionAttributes({ "m_id", "m_num", "m_name", "m_mileage", "m_grade", "m_password", "m_statement", "m_mail" })
public class MainController {
	@Autowired
	private ProductService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(ProductVO pvo, Model model, HttpSession session, HttpServletRequest request) {
		List<ProductVO> productMainList = service.productMainList(pvo);
		List<ProductVO> productMainPopularList = service.productMainPopularList(pvo);
		List<ProductVO> productMainNew = service.productMainNew(pvo);

		if (productMainNew.size() > 0) {
			ArrayList<ProductVO> newList = new ArrayList<ProductVO>();
			newList.add(0, productMainNew.get(0));
			model.addAttribute("newProduct", newList);
		} else {
			model.addAttribute("newProduct", productMainNew);
		}

		if (productMainPopularList.size() > 4) {
			ArrayList<ProductVO> popularList = new ArrayList<ProductVO>();
			popularList.add(0, productMainPopularList.get(0));
			popularList.add(1, productMainPopularList.get(1));
			popularList.add(2, productMainPopularList.get(2));
			popularList.add(3, productMainPopularList.get(3));
			model.addAttribute("popularList", popularList);
		} else {
			model.addAttribute("popularList", productMainPopularList);
		}

		if (productMainList.size() <= 12) {
			model.addAttribute("productList", productMainList);
		} else {
			ArrayList<ProductVO> orderedList = new ArrayList<ProductVO>();
			orderedList.add(0, productMainList.get(0));
			orderedList.add(1, productMainList.get(1));
			orderedList.add(2, productMainList.get(2));
			orderedList.add(3, productMainList.get(3));
			orderedList.add(4, productMainList.get(4));
			orderedList.add(5, productMainList.get(5));
			orderedList.add(6, productMainList.get(6));
			orderedList.add(7, productMainList.get(7));
			orderedList.add(8, productMainList.get(8));
			orderedList.add(9, productMainList.get(9));
			orderedList.add(10, productMainList.get(10));
			orderedList.add(11, productMainList.get(11));
			model.addAttribute("productList", orderedList);
		}

		if (session.getAttribute("m_statement") == null) {
			session.setAttribute("m_statement", "비회원");
			session.setAttribute("m_mail", "ex)abc123@abcc.com");
			session.setAttribute("m_grade", "비회원");
		}
		
		System.out.println(session.getAttribute("m_statement"));
		
		return "index";
	}
}
