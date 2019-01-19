package com.tumbler.member.service;

import javax.servlet.http.HttpSession;

import com.tumbler.member.vo.MemberVO;

public interface MemberService {
	public int memberInsert(MemberVO mvo);

	public MemberVO userIdConfirm(MemberVO mvo);

	public MemberVO userMailConfirm(MemberVO mvo);

	public boolean loginSelect(HttpSession session, MemberVO mvo);

	public MemberVO findId(MemberVO mvo);

	public MemberVO findPw(MemberVO mvo);

	public int memberUpdate(MemberVO mvo);
	
	public int memberStUpdate(String id);

	public int memberQuit(String id);

	public int memberPwUpdate(MemberVO mvo);
	
	public MemberVO selectMemberInfo(String m_id);
	
	public MemberVO getAddress(String id);
}
