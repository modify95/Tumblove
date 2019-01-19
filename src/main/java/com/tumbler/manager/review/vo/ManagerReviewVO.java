package com.tumbler.manager.review.vo;

import org.springframework.web.multipart.MultipartFile;

public class ManagerReviewVO {
	private int r_num;
	private int m_num;
	private int t_num;
	private int p_num;
	private String r_title;
	private String r_content;
	private String r_writer;
	private String r_image;
	private int r_score;
	private int r_count;
	private String r_date;
	
	private int rr_num;
	private String rr_content;
	private String rr_writer;
	private String rr_date;
	
	private int pageNum;
	private int amount;
	
	private String a_id;
	private String m_id;
	private String p_name;

	private MultipartFile file;
	
	public ManagerReviewVO() {
		super();
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getT_num() {
		return t_num;
	}

	public void setT_num(int t_num) {
		this.t_num = t_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_writer() {
		return r_writer;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public String getR_image() {
		return r_image;
	}

	public void setR_image(String r_image) {
		this.r_image = r_image;
	}

	public int getR_score() {
		return r_score;
	}

	public void setR_score(int r_score) {
		this.r_score = r_score;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public int getRr_num() {
		return rr_num;
	}

	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
	}

	public String getRr_content() {
		return rr_content;
	}

	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}

	public String getRr_writer() {
		return rr_writer;
	}

	public void setRr_writer(String rr_writer) {
		this.rr_writer = rr_writer;
	}

	public String getRr_date() {
		return rr_date;
	}

	public void setRr_date(String rr_date) {
		this.rr_date = rr_date;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}	
}
