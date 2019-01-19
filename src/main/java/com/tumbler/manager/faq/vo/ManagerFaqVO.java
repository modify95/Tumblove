package com.tumbler.manager.faq.vo;

public class ManagerFaqVO {
	private int f_num;
	private int a_num;
	private String f_title;
	private String f_content;
	private String f_category;
	private int f_count;
	private String f_date;
	
	private int fr_num;
	private String fr_content;
	private String fr_date;
	
	private String a_id;
	private int pageNum;
	private int amount;
	
	public ManagerFaqVO() {
		super();
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public String getF_content() {
		return f_content;
	}

	public void setF_content(String f_content) {
		this.f_content = f_content;
	}

	public String getF_category() {
		return f_category;
	}

	public void setF_category(String f_category) {
		this.f_category = f_category;
	}

	public int getF_count() {
		return f_count;
	}

	public void setF_count(int f_count) {
		this.f_count = f_count;
	}

	public String getF_date() {
		return f_date;
	}

	public void setF_date(String f_date) {
		this.f_date = f_date;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
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

	public int getFr_num() {
		return fr_num;
	}

	public void setFr_num(int fr_num) {
		this.fr_num = fr_num;
	}

	public String getFr_content() {
		return fr_content;
	}

	public void setFr_content(String fr_content) {
		this.fr_content = fr_content;
	}

	public String getFr_date() {
		return fr_date;
	}

	public void setFr_date(String fr_date) {
		this.fr_date = fr_date;
	}
}
