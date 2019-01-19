package com.tumbler.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.review.dao.ReviewDAO;
import com.tumbler.review.page.Criteria;
import com.tumbler.review.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO rdao;

	@Override
	public List<ReviewVO> reviewList() {
		return rdao.reviewList();
	}

	@Override
	public int reviewInsert(ReviewVO rvo) {
		return rdao.reviewInsert(rvo);
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return rdao.reviewUpdate(rvo);
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		return rdao.reviewDelete(rvo);
	}

	@Override
	public int score_five(ReviewVO rvo) {
		return rdao.score_five(rvo);
	}

	@Override
	public int score_four(ReviewVO rvo) {
		return rdao.score_four(rvo);
	}

	@Override
	public int score_three(ReviewVO rvo) {
		return rdao.score_three(rvo);
	}

	@Override
	public int score_two(ReviewVO rvo) {
		return rdao.score_two(rvo);
	}

	@Override
	public int score_one(ReviewVO rvo) {
		return rdao.score_one(rvo);
	}

	@Override
	public double score_avg(ReviewVO rvo) {
		return rdao.score_avg(rvo);
	}

	@Override
	public List<ReviewVO> reviewListWithPaging(Criteria cri) {
		return rdao.reviewListWithPaging(cri);
	}

	@Override
	public int reviewIdCount(ReviewVO rvo) {
		return rdao.reviewIdCount(rvo);
	}

	@Override
	public List<ReviewVO> readTradingNumber(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return rdao.readTradingNumber(rvo);
	}

	@Override
	public void reviewImageInsert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		rdao.reviewImageInsert(rvo);
	}

	@Override
	public List<ReviewVO> reviewInsertProgress(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return rdao.reviewInsertProgress(rvo);
	}

	@Override
	public int cCountReview(int p_num) {
		// TODO Auto-generated method stub
		return (Integer)rdao.cCountReview(p_num);
	}
}
