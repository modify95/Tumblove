package com.tumbler.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.member.vo.MemberVO;

@Repository
public class MLoginDaoImpl implements MLoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public MemberVO m_idSelect(String m_id) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("m_idSelect", m_id);
	}

	@Override
	public MemberVO loginSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return (MemberVO) session.selectOne("loginSelect", mvo);
	}

}
