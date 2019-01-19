package com.tumbler.review.dao;

import java.util.List;

import com.tumbler.review.page.Criteria;
import com.tumbler.review.vo.ReviewVO;

public interface ReviewDAO {
	public List<ReviewVO> reviewList();
	public int reviewInsert(ReviewVO rvo);
	public int reviewUpdate(ReviewVO rvo);
	public int reviewDelete(ReviewVO rvo);
	public List<ReviewVO> reviewListWithPaging(Criteria cri);
	public int reviewIdCount(ReviewVO rvo);
	
	public int score_five(ReviewVO rvo);
	public int score_four(ReviewVO rvo);
	public int score_three(ReviewVO rvo);
	public int score_two(ReviewVO rvo);
	public int score_one(ReviewVO rvo);
	public double score_avg(ReviewVO rvo);
	public List<ReviewVO> readTradingNumber(ReviewVO rvo);
	public void reviewImageInsert(ReviewVO rvo);
	public List<ReviewVO> reviewInsertProgress(ReviewVO rvo);
	public int cCountReview(int p_num);
}
