package com.tumbler.member.vo;

import java.security.Timestamp;

public class MemberVO {
	private int m_num;
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_phone;
	private String m_address;
	private String m_question;
	private String m_answer;
	private int m_payment;
	private String m_grade;
	private int m_mileage;
	private String m_statement;
	private int m_agreement;
	private String m_birth;
	private String m_mail;
	private String m_gender;
	private Timestamp m_date;
	private String captcha;
	private int count = 0;

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_password() {
		return m_password;
	}

	public void setM_password(String m_password) {
		this.m_password = m_password;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_address() {
		return m_address;
	}

	public void setM_address(String m_address) {
		this.m_address = m_address;
	}

	public String getM_question() {
		return m_question;
	}

	public void setM_question(String m_question) {
		this.m_question = m_question;
	}

	public String getM_answer() {
		return m_answer;
	}

	public void setM_answer(String m_answer) {
		this.m_answer = m_answer;
	}

	public int getM_payment() {
		return m_payment;
	}

	public void setM_payment(int m_payment) {
		this.m_payment = m_payment;
	}

	public String getM_grade() {
		return m_grade;
	}

	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}

	public int getM_mileage() {
		return m_mileage;
	}

	public void setM_mileage(int m_mileage) {
		this.m_mileage = m_mileage;
	}

	public String getM_statement() {
		return m_statement;
	}

	public void setM_statement(String m_statement) {
		this.m_statement = m_statement;
	}

	public int getM_agreement() {
		return m_agreement;
	}

	public void setM_agreement(int m_agreement) {
		this.m_agreement = m_agreement;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_mail() {
		return m_mail;
	}

	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public Timestamp getM_date() {
		return m_date;
	}

	public void setM_date(Timestamp m_date) {
		this.m_date = m_date;
	}

}
