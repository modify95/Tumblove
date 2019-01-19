package com.tumbler.member.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tumbler.login.service.MLoginService;
import com.tumbler.member.service.MemberService;
import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.serivice.ProductService;
import com.tumbler.product.vo.ProductVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/member")
@Log
@SessionAttributes({ "m_id", "m_num", "m_name", "m_statement", "m_mail", "m_grade", "m_mileage", "m_password" })
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/eVer2", method = RequestMethod.POST)
	@ResponseBody
	public int memberStUpdate(@RequestParam("m_id") String m_id, HttpSession session, Model model) {
		int result = 0;

		result = memberService.memberStUpdate(m_id);

		model.addAttribute("m_id");
		model.addAttribute("m_statement");

		return result;
	}

	@RequestMapping(value = "/memberQT", method = RequestMethod.POST)
	@ResponseBody
	public int memberQT(@RequestParam("m_id") String m_id, Model model) {
		int result = 0;

		result = memberService.memberQuit(m_id);

		model.addAttribute("m_id");
		model.addAttribute("m_statement");
		model.addAttribute("m_mileage");

		return result;
	}

	@RequestMapping(value = "/temporaryPw", method = RequestMethod.GET)
	public String temporaryPw(Model model) {
		log.info("findInfoPopUp get 방식에 의한 메서드 호출 성공");

		model.addAttribute("m_mail");

		return "/member/temporaryPw";
	}

	@RequestMapping(value = "/findIdPopUp", method = RequestMethod.GET)
	public String memberFindIdPopUp(Model model) {
		log.info("findInfoPopUp get 방식에 의한 메서드 호출 성공");

		return "/member/findIdPopUp";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String memberFindId2(Model model) {
		log.info("findInfo get 방식에 의한 메서드 호출 성공");

		return "member/findId";
	}

	@ResponseBody
	@RequestMapping(value = "/findId2", method = RequestMethod.POST)
	public String memberFindId(@RequestParam("m_mail") String m_mail, @ModelAttribute MemberVO mvo, Model model) {
		mvo.setM_mail(m_mail);
		mvo = memberService.findId(mvo);

		System.out.println(mvo.getM_id());
		if (mvo.getM_id() == null) {
			return "";
		} else {
			return mvo.getM_id();
		}
	}

	@RequestMapping(value = "/findPwPopUp", method = RequestMethod.GET)
	public String memberFindPwPopUp(Model model) {
		log.info("findInfoPopUp get 방식에 의한 메서드 호출 성공");

		return "/member/findPwPopUp";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String memberFindPw2(Model model) {
		log.info("findInfo get 방식에 의한 메서드 호출 성공");

		return "member/findPw";
	}

	@ResponseBody
	@RequestMapping(value = "/findPw2", method = RequestMethod.POST)
	public String memberFindPw(@RequestParam("m_id") String m_id, @RequestParam("m_mail") String m_mail,
			@ModelAttribute MemberVO mvo, Model model) {
		mvo.setM_id(m_id);
		mvo.setM_mail(m_mail);
		int result = 0;
		MemberVO mVo = memberService.findPw(mvo);
		if (mVo != null) {
			result = 1;
		} else {
			result = 0;
		}

		return result + "";
	}

	@RequestMapping(value = "/eVer", method = RequestMethod.GET)
	public String eVerify(Model model) {
		log.info("captcha get 방식에 의한 메서드 호출 성공");

		return "member/eVer";
	}

	@RequestMapping(value = "/captchaSubmit", method = RequestMethod.GET)
	public String captchaFail(Model model) {
		log.info("captcha post 방식에 의한 메서드 호출 성공");

		return "member/captchaSubmit";
	}

	/**************************************************************
	 * 회원 가입 폼
	 **************************************************************/
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/joinForm";
	}

	/**************************************************************
	 * 회원 가입 실패
	 **************************************************************/
	@RequestMapping(value = "/joinFail", method = RequestMethod.GET)
	public String joinFail(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/joinFail";
	}

	/**************************************************************
	 * 회원 가입 성공
	 **************************************************************/
	@RequestMapping(value = "/joinSuccess", method = RequestMethod.GET)
	public String joinSuccess(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/joinSuccess";
	}

	/**************************************************************
	 * 회원가입 전 약관 동의
	 **************************************************************/
	@RequestMapping(value = "/joinAgree", method = RequestMethod.GET)
	public String joinAgree(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/joinAgree";
	}

	/*************************************************
	 * 사용자 아이디 중복 체크 메서드
	 *************************************************/
	@ResponseBody
	@RequestMapping(value = "/userIdConfirm", method = RequestMethod.POST)
	public String userIdConfirm(@ModelAttribute MemberVO mvo) {
		int result = 0;
		MemberVO mVo = memberService.userIdConfirm(mvo);
		if (mVo != null) {
			result = 1;
		} else {
			result = 0;
		}
		System.out.println(mvo.getM_id());

		return result + "";
	}

	/*************************************************
	 * 사용자 이메일 중복 체크 메서드
	 *************************************************/
	@ResponseBody
	@RequestMapping(value = "/userMailConfirm", method = RequestMethod.POST)
	public String userMailConfirm(@ModelAttribute MemberVO mvo) {
		int result = 0;
		MemberVO mVo = memberService.userMailConfirm(mvo);
		if (mVo != null) {
			result = 1;
		} else {
			result = 0;
		}
		System.out.println(mvo.getM_mail());

		return result + "";
	}

	/**************************************************************
	 * 회원가입 구현하기
	 **************************************************************/
	@RequestMapping(value = "/memberInsert", method = RequestMethod.POST)
	public String memberInsert(@ModelAttribute MemberVO mvo, HttpSession session, @RequestParam String captcha2,
			HttpServletRequest request) throws Exception {
		log.info("join POST 방식에 의한 메서드 호출 성공");

		String captchaValue = (String) session.getAttribute("captcha");
		if (captcha2 == null || !captchaValue.equals(captcha2)) {
			return "redirect:/member/joinFail"; // 메인페이지로 이동
		}

		int result = 0;
		String url = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(mvo.getM_password().getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_password(sb.toString());
			System.out.println(mvo.getM_password());
			log.info(mvo.getM_agreement() + "");

			mvo.setM_payment(0);

			result = memberService.memberInsert(mvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {
			url = "member/joinSuccess";
		} else {
			url = "member/joinFail";
		}
		return url;
	}

	@Autowired
	private MLoginService mloginService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginSelect(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session, HttpServletRequest request,
			Model model) {
		log.info("login POST 방식에 의한 메서드 호출 성공");
		int count = mvo.getCount();
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(mvo.getM_password().getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_password(sb.toString());

			mvo = mloginService.loginSelect(mvo);
			if (mvo.getM_id() == null && mvo.getM_id().equals("")) {
				model.addAttribute("m_id", "");
			} else {
				model.addAttribute("m_num", mvo.getM_num());
				model.addAttribute("m_id", mvo.getM_id());
				model.addAttribute("m_name", mvo.getM_name());
				model.addAttribute("m_statement", mvo.getM_statement());
				model.addAttribute("m_mail", mvo.getM_mail());
				model.addAttribute("m_grade", mvo.getM_grade());
				model.addAttribute("m_mileage", mvo.getM_mileage());
				model.addAttribute("m_password", mvo.getM_password());
				session.setAttribute("m_statement", mvo.getM_statement());
				System.out.println("로그인성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return count + "";
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/alt", method = RequestMethod.GET)
	public String alt(Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/alt";
	}

	@Autowired
	private ProductService service;

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String error(ProductVO pvo, Model model, HttpSession session, HttpServletRequest request) {
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

		return "/member/error";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {

		return "/member/logout";
	}
	
	@RequestMapping(value = "/logout2", method = RequestMethod.GET)
	public String logout2(HttpServletRequest request) {

		return "/member/logout2";
	}

	@RequestMapping(value = "/eVer", method = RequestMethod.POST)
	@ResponseBody
	public String Id(@RequestParam("m_mail") String email) {

		String authNum = "";

		authNum = RandomNum();

		String user = "ygun123@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String password = "190810kim"; // 패스워드

		// SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MemberVO mvo = new MemberVO();
			StringBuffer sb = new StringBuffer();
			System.out.println(email);
			System.out.println(authNum);
			if (email != null && !email.equals("")) {
				sb.append("<!DOCTYPE html>");
				sb.append("<html>");
				sb.append("<head>");
				sb.append("<meta charset=\"UTF-8\">");
				sb.append("<title></title>");
				sb.append("<body>");
				sb.append("<div><h1>" + authNum + "</h1></div><br/><div><h2>이숫자를 이제 돌아가 입력하라구~^^</h2></div>");
				sb.append("</body>");
				sb.append("</html>");
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.setContent(sb.toString(), "text/html; charset=euc-kr");
				// 수신자메일주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

				// Subject
				message.setSubject("인증번호야 임마~^^"); // 메일 제목을 입력

				// Text
				/* message.setText(); */ // 메일 내용을 입력
//            message.setContent(sb.toString(),"");
				// send the message
				Transport.send(message); //// 전송
				System.out.println("message sent successfully...");

				System.out.println("성공");
				return authNum;
			} else {
				return "false";
			}
			// 메일을 발신한다
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("실패");
			return "false";
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("실패");
			return "false";
		}

	}

	@RequestMapping(value = "/temporaryPwPopUp", method = RequestMethod.POST)
	@ResponseBody
	public int Pw(@RequestParam("m_id") String m_id, @RequestParam("m_mail") String email, HttpSession session2)
			throws NoSuchAlgorithmException {

		int result = 0;

		String authNum = "";

		authNum = RandomNum();

		String user = "ygun123@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String password = "190810kim"; // 패스워드

		// SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MemberVO mvo = new MemberVO();

			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(authNum.getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_password(sb.toString());

			mvo.setM_id(m_id);
			result = memberService.memberPwUpdate(mvo);
			StringBuffer sc = new StringBuffer();
			System.out.println(email);
			System.out.println(authNum);
			if (email != null && !email.equals("")) {
				sc.append("<!DOCTYPE html>");
				sc.append("<html>");
				sc.append("<head>");
				sc.append("<meta charset=\"UTF-8\">");
				sc.append("<title></title>");
				sc.append("<body>");
				sc.append("<div><h1>" + authNum + "</h1></div><br/><div><h2>돌아가 비밀번호변경을 꼭 하라구~^^</h2></div>");
				sc.append("</body>");
				sc.append("</html>");
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(user));
				message.setContent(sc.toString(), "text/html; charset=euc-kr");
				// 수신자메일주소
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

				// Subject
				message.setSubject("임시비밀번호야 임마~^^"); // 메일 제목을 입력

				// Text
				/* message.setText(); */ // 메일 내용을 입력
//            message.setContent(sb.toString(),"");
				// send the message
				Transport.send(message); //// 전송
				System.out.println("message sent successfully...");

				System.out.println("성공");
				return result;
			} else {
				return result;
			}
			// 메일을 발신한다
		} catch (AddressException e) {
			e.printStackTrace();
			System.out.println("실패");
			return result;
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("실패");
			return result;
		}

	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 7; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	/**************************************************************
	 * 마이페이지
	 **************************************************************/
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(@ModelAttribute("MemberVO") MemberVO mvo, HttpSession session, HttpServletRequest request,
			Model model) {
		log.info("join get 방식에 의한 메서드 호출 성공");

		return "member/myPage";
	}

	@RequestMapping(value = "/updatePopUp", method = RequestMethod.GET)
	public String updatePopup(Model model) {
		log.info("updatePopup get 방식에 의한 메서드 호출 성공");

		return "/member/updatePopUp";
	}

	@ResponseBody
	@RequestMapping(value = "/updatePopUp", method = RequestMethod.POST)
	public String updatePopup(@ModelAttribute MemberVO mvo, Model model, HttpSession session) {
		log.info("updatePopup get 방식에 의한 메서드 호출 성공");
		int result = 0;
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(mvo.getM_password().getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_id(session.getAttribute("m_id").toString());
			mvo.setM_password(sb.toString());

			mvo = mloginService.loginSelect(mvo);
			if (mvo == null) {
				result = 0;
			} else {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result + "";
	}

	@RequestMapping(value = "/memberUD", method = RequestMethod.GET)
	public String memberUD(Model model) {
		log.info("memberUD get 방식에 의한 메서드 호출 성공");

		return "/member/memberUD";
	}

	@ResponseBody
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute MemberVO mvo, HttpSession session, HttpServletRequest request,
			Model model) {
		int result = 0;
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(mvo.getM_password().getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_password(sb.toString());
			result = memberService.memberUpdate(mvo);
			log.info("memberUpdate post 방식에 의한 메서드 호출 성공");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return result + "";
	}

	@RequestMapping(value = "/quitPopUp", method = RequestMethod.GET)
	public String quitPopUp(Model model) {
		log.info("quitPopUp get 방식에 의한 메서드 호출 성공");

		return "/member/quitPopUp";
	}

	@ResponseBody
	@RequestMapping(value = "/quitPopUp", method = RequestMethod.POST)
	public String quitPopUp(@ModelAttribute MemberVO mvo, Model model, HttpSession session) {
		log.info("quitPopUp get 방식에 의한 메서드 호출 성공");
		int result = 0;
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");

			sh.update(mvo.getM_password().getBytes());

			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			mvo.setM_id(session.getAttribute("m_id").toString());
			mvo.setM_password(sb.toString());

			mvo = mloginService.loginSelect(mvo);
			if (mvo == null) {
				result = 0;
			} else {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result + "";
	}

	@RequestMapping(value = "/memberQT", method = RequestMethod.GET)
	public String memberQT(Model model) {
		log.info("memberQT get 방식에 의한 메서드 호출 성공");

		return "/member/memberQT";
	}

}