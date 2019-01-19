package com.tumbler.manager.review.dao;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.review.vo.ManagerReviewVO;

public interface ManagerReviewDAO {
	public void mReviewNoticeInsert(ManagerReviewVO rvo);
	public List<ManagerReviewVO> mReviewNoticeList();
	public int mReviewTotal();
	public ManagerReviewVO mReviewNoticeDetail(int r_num);
	public void mReviewNoticeDelete(int r_num);
	public void mReviewReply(ManagerReviewVO rvo);
	public void mReviewInsert(ManagerReviewVO rvo);
	public List<ManagerReviewVO> mReviewList(Criteria cri);
	public ManagerReviewVO mReviewDetail(int r_num);
	public void mReviewCount(int r_num);
	public List<ManagerReviewVO> mReviewReplyList();
	public void mReviewReplyEdit(ManagerReviewVO rvo);
	public void mReviewReplyDelete(int rr_num);
	public List<ManagerReviewVO> mReviewSearch(Criteria cri);
	public int mReviewSearchedTotal(Criteria cri);
	public List<ManagerReviewVO> mReviewNoticeSearch();
}
