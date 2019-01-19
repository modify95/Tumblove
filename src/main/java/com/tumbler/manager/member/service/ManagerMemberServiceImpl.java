package com.tumbler.manager.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.member.dao.ManagerMemberDAO;
import com.tumbler.manager.member.vo.ManagerMemberVO;
@Service
public class ManagerMemberServiceImpl implements ManagerMemberService {
	@Autowired
	private ManagerMemberDAO memberDao;
	
	@Override
	public List<ManagerMemberVO> memberList(Criteria cri) {
		List<ManagerMemberVO> memberList = memberDao.memberList(cri); 
		return memberList;
	}

	@Override
	public ManagerMemberVO memberDetail(ManagerMemberVO mvo) {
		ManagerMemberVO detail = memberDao.memberDetail(mvo);
		return detail;
	}

	@Override
	public int memberTotal(Criteria cri) {
		int total = memberDao.memberTotal(cri);
		return total;
	}

	@Override
	public List<ManagerMemberVO> memberSearch(Criteria cri) {
		List<ManagerMemberVO> memberSearch = memberDao.memberSearch(cri);
		return memberSearch;
	}

	@Override
	public int memberSearchedTotal(Criteria cri) {
		int searched_Total = memberDao.memberSearchedTotal(cri);
		return searched_Total;
	}
	

}
