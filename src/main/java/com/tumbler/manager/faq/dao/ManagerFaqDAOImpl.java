package com.tumbler.manager.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.faq.vo.ManagerFaqVO;

@Repository
public class ManagerFaqDAOImpl implements ManagerFaqDAO {
	@Autowired
	SqlSession session;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

	@Override
	public void mFaqInsert(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		session.insert("mFaqInsert", fvo);
	}

	@Override
	public List<ManagerFaqVO> mFaqList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mFaqList", cri);
	}

	@Override
	public int mFaqTotal() {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mFaqTotal");
	}

	@Override
	public ManagerFaqVO mFaqDetail(int f_num) {
		// TODO Auto-generated method stub
		return (ManagerFaqVO)session.selectOne("mFaqDetail", f_num);
	}

	@Override
	public void mFaqDelete(int f_num) {
		// TODO Auto-generated method stub
		session.delete("mFaqDelete", f_num);
	}

	@Override
	public void mFaqReply(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		session.insert("mFaqReply", fvo);
	}

	@Override
	public List<ManagerFaqVO> mFaqReplyList(int f_num) {
		// TODO Auto-generated method stub
		return session.selectList("mFaqReplyList", f_num);
	}

	@Override
	public void mFaqReplyEdit(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		session.update("mFaqReplyEdit", fvo);
	}

	@Override
	public void mFaqReplyDelete(int fr_num) {
		// TODO Auto-generated method stub
		session.delete("mFaqReplyDelete", fr_num);
	}

	@Override
	public void mFaqReplyDeleteAll(int f_num) {
		// TODO Auto-generated method stub
		session.delete("mFaqReplyDeleteAll", f_num);
	}

	@Override
	public void mFaqCount(int f_num) {
		// TODO Auto-generated method stub
		session.update("mFaqCount", f_num);
	}

	@Override
	public List<ManagerFaqVO> mFaqSearch(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mFaqSearch", cri);
	}

	@Override
	public int mFaqSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mFaqSearchedTotal", cri);
	}
}
