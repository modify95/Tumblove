package com.tumbler.manager.member.service;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.member.vo.ManagerMemberVO;

public interface ManagerMemberService {
	public List<ManagerMemberVO> memberList(Criteria cri);
	public ManagerMemberVO memberDetail(ManagerMemberVO mvo);
	public int memberTotal(Criteria cri);
	public List<ManagerMemberVO> memberSearch(Criteria cri);
	public int memberSearchedTotal(Criteria cri);
}
