package com.tumbler.manager.notice.vo;

import com.tumbler.manager.admin.vo.AdminVO;

public class ManagerNoticeVO extends AdminVO {
	private int n_num; //게시판 번호
	private int a_num; // 관리자 번호
	private String a_id; //관리자 아이디
	private String n_title; // 공지사항 제목
	private String n_content; // 공지사항 내용
	private int n_count; // 공지사항 조회수
	private String n_date; // 공지사항 등록일
	private int pageNum;
	private int amount;
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public String getN_date() {
		return n_date;
	}
	public void setN_date(String n_date) {
		this.n_date = n_date;
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
