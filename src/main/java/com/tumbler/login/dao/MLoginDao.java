package com.tumbler.login.dao;

import com.tumbler.member.vo.MemberVO;

public interface MLoginDao {
	public MemberVO m_idSelect(String m_id);
	public MemberVO loginSelect(MemberVO mvo);
}
