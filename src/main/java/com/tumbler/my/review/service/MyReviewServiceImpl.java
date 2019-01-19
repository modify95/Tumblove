package com.tumbler.my.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.my.review.dao.MyReviewDAO;
import com.tumbler.review.vo.ReviewVO;
@Service
public class MyReviewServiceImpl implements MyReviewService {
	
	@Autowired
	private MyReviewDAO mrdao;
	
	@Override
	public List<ReviewVO> myReviewList(String r_writer) {
		return mrdao.myReviewList(r_writer);
	}

	@Override
	public int myReviewUpdate(ReviewVO rvo) {
		return mrdao.myReviewUpdate(rvo);
	}

	@Override
	public int myReviewDelete(ReviewVO rvo) {
		return mrdao.myReviewDelete(rvo);
	}

}
