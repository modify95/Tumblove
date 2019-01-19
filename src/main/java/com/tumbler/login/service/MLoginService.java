package com.tumbler.login.service;

import com.tumbler.member.vo.MemberVO;

public interface MLoginService {
	public MemberVO m_idSelect(String m_id);
	public MemberVO loginSelect(MemberVO mvo);
}
