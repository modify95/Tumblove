package com.tumbler.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tumbler.cart.service.CartService;
import com.tumbler.cart.vo.CartVO;
import com.tumbler.member.service.MemberService;
import com.tumbler.member.vo.MemberVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		String m_id = (String)session.getAttribute("m_id");
		List<CartVO> list = cartService.cartList(m_id);
		MemberVO info = memberService.selectMemberInfo(m_id);
		model.addAttribute("cartList", list);
		model.addAttribute("minfo", info);

		return "cart/cartList";
	}

	@RequestMapping(value = "/editCart", method = RequestMethod.GET)
	public String editCartView(HttpServletRequest request, Model model) {
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		CartVO cvo = cartService.cartInfo(c_num);
		model.addAttribute("cartInfo", cvo);

		return "cart/editCart";
	}

	@ResponseBody
	@RequestMapping(value = "/editCart", method = RequestMethod.POST)
	public String editCart(@ModelAttribute CartVO cvo) {
		int result = cartService.editCart(cvo);
		String value = "";

		if (result == 1) {
			value = "success";
		} else {
			value = "false";
		}

		return value;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteCart1", method = RequestMethod.POST)
	public String deleteCart1(@RequestParam int c_num) {
		int result = cartService.deleteCart1(c_num);
		String value = "";

		if (result == 1) {
			value = "success";
		} else {
			value = "false";
		}

		return value;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteCart2", method = RequestMethod.POST)
	public String deleteCart2(@RequestParam("clist") List<Integer> clist) {
		int result = cartService.deleteCart2(clist);
		String value = "";
		if (result == clist.size()) {
			value = "success";
		} else {
			value = "false";
		}

		return value;
	}

	@ResponseBody
	@RequestMapping(value = "/addCart", method = RequestMethod.POST)
	public String addCart(@ModelAttribute CartVO cvo, HttpSession session) {
		cvo.setM_num(memberService.selectMemberInfo((String)session.getAttribute("m_id")).getM_num());
		int result = cartService.addCart(cvo);
		String value = "";

		if (result == 1) {
			value = "success";
		} else {
			value = "false";
		}

		return value;
	}

}
