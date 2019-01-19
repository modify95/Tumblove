package com.tumbler.manager.common;

public class Criteria {
	private int pageNum;
	private int amount;
	
	private String search_option;
	private String search_keyword;
	private int searched_total;
	
	public Criteria() {
		this(1, 6);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
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

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public int getSearched_total() {
		return searched_total;
	}

	public void setSearched_total(int searched_total) {
		this.searched_total = searched_total;
	}
}
