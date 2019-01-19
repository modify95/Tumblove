package com.tumbler.manager.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.faq.dao.ManagerFaqDAO;
import com.tumbler.manager.faq.vo.ManagerFaqVO;

@Service
public class ManagerFaqServiceImpl implements ManagerFaqService {
	@Autowired
	ManagerFaqDAO dao;
	
	@Override
	public void mFaqInsert(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		dao.mFaqInsert(fvo);
	}
	
	@Override
	public List<ManagerFaqVO> mFaqList(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.mFaqList(cri);
	}

	@Override
	public int mFaqTotal() {
		// TODO Auto-generated method stub
		return dao.mFaqTotal();
	}

	@Override
	public ManagerFaqVO mFaqDetail(int f_num) {
		// TODO Auto-generated method stub
		return dao.mFaqDetail(f_num);
	}

	@Override
	public void mFaqDelete(int f_num) {
		// TODO Auto-generated method stub
		dao.mFaqDelete(f_num);
	}

	@Override
	public void mFaqReply(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		dao.mFaqReply(fvo);
	}

	@Override
	public List<ManagerFaqVO> mFaqReplyList(int f_num) {
		// TODO Auto-generated method stub
		return dao.mFaqReplyList(f_num);
	}

	@Override
	public void mFaqReplyEdit(ManagerFaqVO fvo) {
		// TODO Auto-generated method stub
		dao.mFaqReplyEdit(fvo);
	}

	@Override
	public void mFaqReplyDelete(int fr_num) {
		// TODO Auto-generated method stub
		dao.mFaqReplyDelete(fr_num);
	}

	@Override
	public void mFaqReplyDeleteAll(int f_num) {
		// TODO Auto-generated method stub
		dao.mFaqReplyDeleteAll(f_num);
	}

	@Override
	public void mFaqCount(int f_num) {
		// TODO Auto-generated method stub
		dao.mFaqCount(f_num);
	}

	@Override
	public List<ManagerFaqVO> mFaqSearch(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerFaqVO> list = dao.mFaqSearch(cri);
		return list;
	}

	@Override
	public int mFaqSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.mFaqSearchedTotal(cri);
	}

}
