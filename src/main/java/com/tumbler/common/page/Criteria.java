package com.tumbler.common.page;

public class Criteria {
	private int pageNum;
	private int amount;
	private String p_category;
	
	private String p_material;
	private String p_sub_category;
	private String keyword;
	private String order;
	
	public Criteria() {
		this(1,16);
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getP_material() {
		return p_material;
	}

	public void setP_material(String p_material) {
		this.p_material = p_material;
	}

	public String getP_sub_category() {
		return p_sub_category;
	}

	public void setP_sub_category(String p_sub_category) {
		this.p_sub_category = p_sub_category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
}
