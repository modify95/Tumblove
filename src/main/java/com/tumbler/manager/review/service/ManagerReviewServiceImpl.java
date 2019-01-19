package com.tumbler.manager.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.review.dao.ManagerReviewDAO;
import com.tumbler.manager.review.vo.ManagerReviewVO;

@Service
public class ManagerReviewServiceImpl implements ManagerReviewService {
	@Autowired
	ManagerReviewDAO dao;
	
	@Override
	public void mReviewNoticeInsert(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		dao.mReviewNoticeInsert(rvo);
	}

	@Override
	public List<ManagerReviewVO> mReviewNoticeList() {
		// TODO Auto-generated method stub
		return dao.mReviewNoticeList();
	}

	@Override
	public int mReviewTotal() {
		// TODO Auto-generated method stub
		return dao.mReviewTotal();
	}

	@Override
	public ManagerReviewVO mReviewNoticeDetail(int r_num) {
		// TODO Auto-generated method stub
		return dao.mReviewNoticeDetail(r_num);
	}

	@Override
	public void mReviewNoticeDelete(int r_num) {
		// TODO Auto-generated method stub
		dao.mReviewNoticeDelete(r_num);
	}

	@Override
	public void mReviewReply(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		dao.mReviewReply(rvo);
	}

	@Override
	public void mReviewInsert(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		dao.mReviewInsert(rvo);
	}

	@Override
	public List<ManagerReviewVO> mReviewList(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.mReviewList(cri);
	}

	@Override
	public ManagerReviewVO mReviewDetail(int r_num) {
		// TODO Auto-generated method stub
		return dao.mReviewDetail(r_num);
	}

	@Override
	public void mReviewCount(int r_num) {
		// TODO Auto-generated method stub
		dao.mReviewCount(r_num);
	}

	@Override
	public List<ManagerReviewVO> mReviewReplyList() {
		// TODO Auto-generated method stub
		return dao.mReviewReplyList();
	}

	@Override
	public void mReviewReplyEdit(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		dao.mReviewReplyEdit(rvo);
	}

	@Override
	public void mReviewReplyDelete(int rr_num) {
		// TODO Auto-generated method stub
		dao.mReviewReplyDelete(rr_num);
	}

	@Override
	public List<ManagerReviewVO> mReviewSearch(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerReviewVO> list = dao.mReviewSearch(cri);
		return list;
	}

	@Override
	public int mReviewSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.mReviewSearchedTotal(cri);
	}

	@Override
	public List<ManagerReviewVO> mReviewNoticeSearch() {
		// TODO Auto-generated method stub
		List<ManagerReviewVO> list = dao.mReviewNoticeSearch();
		return list;
	}

}
