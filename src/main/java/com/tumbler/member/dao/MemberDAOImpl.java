package com.tumbler.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.member.vo.MemberVO;

@Repository
@Transactional
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	@Override
	public int memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.insert("memberInsert", mvo);
	}

	@Override
	public MemberVO userIdConfirm(MemberVO mvo) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("userIdConfirm", mvo);
	}

	@Override
	public MemberVO loginSelect(MemberVO mvo) {
		return session.selectOne("loginSelect", mvo);
	}

	@Override
	public int memberStUpdate(String id) {
		// TODO Auto-generated method stub
		return session.update("memberStUpdate", id);
	}

	@Override
	public MemberVO userMailConfirm(MemberVO mvo) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("userMailConfirm", mvo);
	}

	@Override
	public MemberVO findId(MemberVO mvo) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("findId", mvo);
	}

	@Override
	public MemberVO findPw(MemberVO mvo) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("findPw", mvo);
	}

	@Override
	public int memberPwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("memberPwUpdate", mvo);
	}

	@Override
	public int memberQuit(String id) {
		// TODO Auto-generated method stub
		return session.update("memberQuit", id);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return session.update("memberUpdate", mvo);
	}
	
	@Override
	public MemberVO selectMemberInfo(String m_id) {
		// TODO Auto-generated method stub
		return session.selectOne("selectMemberInfo", m_id);
	}
	
	@Override
	public MemberVO getAddress(String id) {
		// TODO Auto-generated method stub
		return (MemberVO)session.selectOne("getAddress", id);
	}
}
