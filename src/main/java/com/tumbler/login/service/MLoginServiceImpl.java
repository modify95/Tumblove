package com.tumbler.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.login.dao.MLoginDao;
import com.tumbler.member.dao.MemberDAO;
import com.tumbler.member.vo.MemberVO;

import lombok.extern.java.Log;

@Log
@Service
@Transactional
public class MLoginServiceImpl implements MLoginService {

	@Autowired
	private MLoginDao mloginDao;

	@Autowired
	private MemberDAO memberDao;

	@Override
	public MemberVO m_idSelect(String m_id) {
		// TODO Auto-generated method stub
		return mloginDao.m_idSelect(m_id);
	}

	@Override
	public MemberVO loginSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDao.loginSelect(mvo);
	}

}
