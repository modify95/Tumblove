package com.tumbler.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nl.captcha.Captcha;
import nl.captcha.servlet.CaptchaServletUtil;

public class CaptchaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Captcha captcha = new Captcha.Builder(148, 48).addText().addNoise().addNoise().addNoise().addBackground()
				.build();

		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Max-Age", 0);
		response.setContentType("image/png");
		CaptchaServletUtil.writeImage(response, captcha.getImage()); // 이미지 그리기
		String captcha_str = captcha.getAnswer();
		request.getSession().setAttribute("captcha", captcha_str); // 값 저장
	}

}
