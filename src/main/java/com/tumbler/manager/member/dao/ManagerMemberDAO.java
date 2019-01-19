package com.tumbler.manager.member.dao;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.member.vo.ManagerMemberVO;

public interface ManagerMemberDAO {
	public List<ManagerMemberVO> memberList(Criteria cri);
	public ManagerMemberVO memberDetail(ManagerMemberVO mvo);
	public int memberTotal(Criteria cri);
	public List<ManagerMemberVO> memberSearch(Criteria cri);
	public int memberSearchedTotal(Criteria cri);
}
