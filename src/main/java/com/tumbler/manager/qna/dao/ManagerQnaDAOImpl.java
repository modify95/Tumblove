package com.tumbler.manager.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.qna.vo.ManagerQnaVO;

@Repository
public class ManagerQnaDAOImpl implements ManagerQnaDAO {
	@Autowired SqlSession session;
	@Override
	public List<ManagerQnaVO> mQnaList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mQnaList", cri);
	}
	@Override
	public int mQnaTotal() {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mQnaTotal");
	}
	@Override
	public void mQnaRegist(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		session.insert("mQnaRegist", qvo);
	}
	@Override
	public List<ManagerQnaVO> mQnaNoticeList() {
		// TODO Auto-generated method stub
		return session.selectList("mQnaNoticeList");
	}
	@Override
	public ManagerQnaVO mQnaNoticeDetail(int q_num) {
		// TODO Auto-generated method stub
		return (ManagerQnaVO)session.selectOne("mQnaNoticeDetail", q_num);
	}
	@Override
	public void mQnaDelete(int q_num) {
		// TODO Auto-generated method stub
		session.delete("mQnaDelete", q_num);
	}
	@Override
	public ManagerQnaVO mQnaDetail(int q_num) {
		// TODO Auto-generated method stub
		return (ManagerQnaVO)session.selectOne("mQnaDetail", q_num);
	}
	@Override
	public void mQnaReply(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		session.insert("mQnaReply", qvo);
	}
	@Override
	public List<ManagerQnaVO> mQnaReplyList(int q_num) {
		// TODO Auto-generated method stub
		return session.selectList("mQnaReplyList", q_num);
	}
	@Override
	public void mQnaReplyEdit(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		session.update("mQnaReplyEdit", qvo);
	}
	@Override
	public void mQnaReplyDelete(int qr_num) {
		// TODO Auto-generated method stub
		session.delete("mQnaReplyDelete", qr_num);
	}
	@Override
	public void mQnaCount(int q_num) {
		// TODO Auto-generated method stub
		session.update("mQnaCount", q_num);
	}
	@Override
	public List<ManagerQnaVO> mQnaSearch(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mQnaSearch", cri);
	}
	@Override
	public int mQnaSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mQnaSearchedTotal", cri);
	}
	@Override
	public List<ManagerQnaVO> mQnaNoticeSearch() {
		// TODO Auto-generated method stub
		return session.selectList("mQnaNoticeSearch");
	}

}
