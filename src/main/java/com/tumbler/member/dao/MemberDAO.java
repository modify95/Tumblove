package com.tumbler.member.dao;

import com.tumbler.member.vo.MemberVO;

public interface MemberDAO {
	public int memberInsert(MemberVO mvo);

	public MemberVO userIdConfirm(MemberVO mvo);

	public MemberVO userMailConfirm(MemberVO mvo);

	public MemberVO loginSelect(MemberVO mvo);
	
	public MemberVO findId(MemberVO mvo);
	
	public MemberVO findPw(MemberVO mvo);
	
	public int memberUpdate(MemberVO mvo);

	public int memberStUpdate(String id);
	
	public int memberQuit(String id);
	
	public int memberPwUpdate(MemberVO mvo);
	
	public MemberVO selectMemberInfo(String m_id);
	
	public MemberVO getAddress(String id);
}
