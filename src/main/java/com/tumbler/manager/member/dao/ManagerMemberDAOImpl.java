package com.tumbler.manager.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.member.vo.ManagerMemberVO;
@Repository
public class ManagerMemberDAOImpl implements ManagerMemberDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ManagerMemberVO> memberList(Criteria cri) {
		
		return session.selectList("memberList",cri);
	}

	@Override
	public ManagerMemberVO memberDetail(ManagerMemberVO mvo) {
		
		return (ManagerMemberVO)session.selectOne("memberDetail",mvo);
	}

	@Override
	public int memberTotal(Criteria cri) {
		
		return (Integer)session.selectOne("memberTotal",cri);
	}

	@Override
	public List<ManagerMemberVO> memberSearch(Criteria cri) {
		
		return session.selectList("memberSearch", cri);
	}

	@Override
	public int memberSearchedTotal(Criteria cri) {
		
		return (Integer)session.selectOne("memberSearchedTotal",cri);
	}

	
}
