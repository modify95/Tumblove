package com.tumbler.review.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
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
	private Date r_date;
	private MultipartFile file;

	private String page; // 페이지 번호
	private String pageSize; // 페이지에 보여주는 줄수
	private String start_row; // 시작 레코드 번호
	private String end_row; // 종료 레코드 번호
	
	private int pageNum;
	private int amount;

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

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getStart_row() {
		return start_row;
	}

	public void setStart_row(String start_row) {
		this.start_row = start_row;
	}

	public String getEnd_row() {
		return end_row;
	}

	public void setEnd_row(String end_row) {
		this.end_row = end_row;
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
	
}
