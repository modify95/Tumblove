package com.tumbler.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.review.page.Criteria;
import com.tumbler.review.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	private SqlSession session;

	@Override
	public List<ReviewVO> reviewList() {
		return session.selectList("reviewList");
	}

	@Override
	public int reviewInsert(ReviewVO rvo) {
		return session.insert("reviewInsert", rvo);
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewUpdate", rvo);
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		return session.delete("reviewDelete", rvo);
	}

	// 평점 5점
	@Override
	public int score_five(ReviewVO rvo) {
		return session.selectOne("score_five", rvo);
	}

	// 평점 4점
	@Override
	public int score_four(ReviewVO rvo) {
		return session.selectOne("score_four", rvo);
	}

	// 평점 3점
	@Override
	public int score_three(ReviewVO rvo) {
		return session.selectOne("score_three", rvo);
	}

	// 평점 2점
	@Override
	public int score_two(ReviewVO rvo) {
		return session.selectOne("score_two", rvo);
	}

	// 평점 1점
	@Override
	public int score_one(ReviewVO rvo) {
		return session.selectOne("score_one", rvo);
	}

	// 평점 평균
	@Override
	public double score_avg(ReviewVO rvo) {
		return session.selectOne("score_avg", rvo);
	}
	
	// 페이징
	@Override
	public List<ReviewVO> reviewListWithPaging(Criteria cri) {
		return session.selectList("reviewListWithPaging",cri);
	}
	// ID 카운트
	@Override
	public int reviewIdCount(ReviewVO rvo) {
		return session.selectOne("reviewIdCount",rvo);
	}

	@Override
	public List<ReviewVO> readTradingNumber(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("readTradingNumber", rvo);
	}

	@Override
	public void reviewImageInsert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		session.insert("reviewImageInsert", rvo);
	}

	@Override
	public List<ReviewVO> reviewInsertProgress(ReviewVO rvo) {
		// TODO Auto-generated method stub
		return session.selectList("reviewInsertProgress", rvo);
	}

	@Override
	public int cCountReview(int p_num) {
		// TODO Auto-generated method stub
		return session.selectOne("cCountReview", p_num);
	}

}
