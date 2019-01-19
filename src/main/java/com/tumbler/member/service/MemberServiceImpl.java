package com.tumbler.member.service;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.member.dao.LoginStore;
import com.tumbler.member.dao.MemberDAO;
import com.tumbler.member.vo.MemberVO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;

	// 회원가입 구현
	@Override
	public int memberInsert(MemberVO mvo) {
		int result = 0;
		try {
			result = memberDao.memberInsert(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public MemberVO userIdConfirm(MemberVO mvo) {
		return memberDao.userIdConfirm(mvo);
	}

	@Override
	public boolean loginSelect(HttpSession session, MemberVO mvo) {
		mvo = memberDao.loginSelect(mvo);
		if(mvo !=null) {
			// 이미 로그인 되어 있다면, 기존 로그인 세션을 종료
			LoginStore loginStore = LoginStore.getInstance();
			if(loginStore.get(mvo.getM_id())!=null) {
				loginStore.logout(mvo.getM_id());
			}
			
			//새로운 로그인 세션 입력
			loginStore.add(mvo.getM_id(), session);
			
			session.setAttribute(session.getId(), mvo);
		}
		return mvo != null;
	}

	@Override
	public int memberStUpdate(String id) {
		int result = 0;
		try {
			result = memberDao.memberStUpdate(id);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public MemberVO userMailConfirm(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDao.userMailConfirm(mvo);
	}

	@Override
	public MemberVO findId(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDao.findId(mvo);
	}

	@Override
	public MemberVO findPw(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDao.findPw(mvo);
	}

	@Override
	public int memberPwUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return memberDao.memberPwUpdate(mvo);
	}

	@Override
	public int memberQuit(String id) {
		int result = 0;
		try {
			result = memberDao.memberQuit(id);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		int result = 0;
		try {
			result = memberDao.memberUpdate(mvo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	@Override
	public MemberVO selectMemberInfo(String m_id) {
		// TODO Auto-generated method stub
		return memberDao.selectMemberInfo(m_id);
	}
	
	@Override
	public MemberVO getAddress(String id) {
		// TODO Auto-generated method stub
		return memberDao.getAddress(id);
	}
}
