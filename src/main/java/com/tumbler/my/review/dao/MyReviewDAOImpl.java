package com.tumbler.my.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.review.vo.ReviewVO;
@Repository
public class MyReviewDAOImpl implements MyReviewDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ReviewVO> myReviewList(String r_writer) {
		return session.selectList("myReviewList",r_writer);
	}
	@Override
	public int myReviewUpdate(ReviewVO rvo) {
		return session.update("myReviewUpdate",rvo);
	}

	@Override
	public int myReviewDelete(ReviewVO rvo) {
		return session.delete("myReviewDelete",rvo);
	}

}
