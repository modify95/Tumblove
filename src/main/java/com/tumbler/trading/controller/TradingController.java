package com.tumbler.trading.controller;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import com.tumbler.cart.service.CartService;
import com.tumbler.member.service.MemberService;
import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.vo.ProductVO;
import com.tumbler.trading.service.TradingService;
import com.tumbler.trading.vo.Order_TradingVO;
import com.tumbler.trading.vo.TradingVO;

@Controller
@RequestMapping("/trading")
public class TradingController {

	@Autowired
	private TradingService tradingService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private CartService cartService;

	@RequestMapping(value = "/cartOrder", method = RequestMethod.POST)
	public String cartOder(@RequestParam("clist") List<Integer> clist, HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("m_id");
		MemberVO member = memberService.selectMemberInfo(m_id);
		List<ProductVO> list = new ArrayList<>();
		for (int i = 0; i < clist.size(); i++) {
			list.add(tradingService.cartOrder(clist.get(i)));
		}

		model.addAttribute("orderList", list);
		model.addAttribute("memberInfo", member);

		return "trading/tradingList";
	}

	@RequestMapping(value = "/detailOrder", method = RequestMethod.POST)
	public String detailOrder(@RequestParam int p_num, @RequestParam int amount, HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("m_id");
		MemberVO member = memberService.selectMemberInfo(m_id);
		ProductVO pvo = tradingService.detailOrder(p_num);

		model.addAttribute("order", pvo);
		model.addAttribute("amount", amount);
		model.addAttribute("memberInfo", member);

		return "trading/tradingList";
	}
	
	@RequestMapping(value="/order", method = RequestMethod.POST)
	public ModelAndView order(Order_TradingVO otvo) {
		ModelAndView mav = new ModelAndView();
		
		tradingService.insertOrderTrading(otvo);
		
		mav.setViewName("trading/payment");
		
		return mav;
	}

	@RequestMapping(value = "/payment")
	public String paymentView(HttpServletRequest request, Model model) {
		String mode = (String) request.getParameter("mode");
		String price = (String) request.getParameter("price");

		if (mode.equals("card")) {
			model.addAttribute("mode", "card");
		} else {
			model.addAttribute("mode", "bank");
		}
		model.addAttribute("price", price);
		return "trading/payment";
	}
	
	@RequestMapping(value = "/paymentComplete")
	public String test(@ModelAttribute TradingVO tvo, HttpSession session, @ModelAttribute Order_TradingVO otvo,
			@RequestParam("pnumlist[]") int[] pnumlist, @RequestParam("amountlist[]") int[] amountlist,
			@RequestParam("cnumlist[]") int[] cnumlist, HttpServletRequest request) {
		String m_id = (String) session.getAttribute("m_id");
		MemberVO member = memberService.selectMemberInfo(m_id);
		
		String url = request.getParameter("url");
		tvo.setM_num(member.getM_num());
		otvo.setM_num(member.getM_num());

		tradingService.insertTrading(tvo);

		otvo.setT_num(tvo.getT_num());

		for (int i = 0; i < pnumlist.length; i++) {
			otvo.setP_num(pnumlist[i]);
			otvo.setO_amount(amountlist[i]);
			tradingService.insertOrderTrading(otvo);
		}

		if (url.equals("cart")) {
			List<Integer> clist = new ArrayList<>();
			for (int i = 0; i < cnumlist.length; i++) {
				clist.add(cnumlist[i]);
			}
			cartService.deleteCart2(clist);
		}
		
		member.setM_mileage(Integer.parseInt(request.getParameter("m_mileage")) * -1);
		tradingService.updateMileage(member);
		member.setM_mileage(tvo.getT_mileage());
		tradingService.updateMileage(member);

		return "trading/paymentComplete";
	}
}
