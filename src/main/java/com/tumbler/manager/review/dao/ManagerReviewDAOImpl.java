package com.tumbler.manager.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.review.vo.ManagerReviewVO;

@Repository
public class ManagerReviewDAOImpl implements ManagerReviewDAO{
	@Autowired
	SqlSession session;
	@Override
	public void mReviewNoticeInsert(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		session.insert("mReviewNoticeInsert", rvo);
	}
	@Override
	public List<ManagerReviewVO> mReviewNoticeList() {
		// TODO Auto-generated method stub
		return session.selectList("mReviewNoticeList");
	}
	@Override
	public int mReviewTotal() {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mReviewTotal");
	}
	@Override
	public ManagerReviewVO mReviewNoticeDetail(int r_num) {
		// TODO Auto-generated method stub
		return (ManagerReviewVO)session.selectOne("mReviewNoticeDetail", r_num);
	}
	@Override
	public void mReviewNoticeDelete(int r_num) {
		// TODO Auto-generated method stub
		session.delete("mReviewNoticeDelete", r_num);
	}
	@Override
	public void mReviewReply(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		session.insert("mReviewReply", rvo);
	}
	@Override
	public void mReviewInsert(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		session.insert("mReviewInsert", rvo);
	}
	@Override
	public List<ManagerReviewVO> mReviewList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mReviewList", cri);
	}
	@Override
	public ManagerReviewVO mReviewDetail(int r_num) {
		// TODO Auto-generated method stub
		return (ManagerReviewVO)session.selectOne("mReviewDetail", r_num);
	}
	@Override
	public void mReviewCount(int r_num) {
		// TODO Auto-generated method stub
		session.update("mReviewCount", r_num);
	}
	@Override
	public List<ManagerReviewVO> mReviewReplyList() {
		// TODO Auto-generated method stub
		return session.selectList("mReviewReplyList");
	}
	@Override
	public void mReviewReplyEdit(ManagerReviewVO rvo) {
		// TODO Auto-generated method stub
		session.update("mReviewReplyEdit", rvo);
	}
	@Override
	public void mReviewReplyDelete(int rr_num) {
		// TODO Auto-generated method stub
		session.delete("mReviewReplyDelete", rr_num);
	}
	@Override
	public List<ManagerReviewVO> mReviewSearch(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mReviewSearch", cri);
	}
	@Override
	public int mReviewSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mReviewSearchedTotal", cri);
	}
	@Override
	public List<ManagerReviewVO> mReviewNoticeSearch() {
		// TODO Auto-generated method stub
		return session.selectList("mReviewNoticeSearch");
	}

}
