package com.tumbler.my.review.dao;

import java.util.List;

import com.tumbler.review.vo.ReviewVO;

public interface MyReviewDAO {
	public List<ReviewVO> myReviewList(String r_writer);
	public int myReviewUpdate(ReviewVO rvo);
	public int myReviewDelete(ReviewVO rvo);
}
