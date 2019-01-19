package com.tumbler.review.page;

public class PageDTO {
	private int startPage; // 화면에 보이는 페이지 시작 번호
	private int endPage;   // 화면에 보이는 페이지 끝 번호
	private boolean prev;  // 이전 으로 이동 가능한 링크의 표시여부
	private boolean next;  // 다음 으로 이동 가능한 링크의 표시 여부

	private int total;
	private Criteria cri;

	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;

	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	
	
	
	
}
