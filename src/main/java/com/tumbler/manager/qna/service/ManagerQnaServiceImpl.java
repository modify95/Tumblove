package com.tumbler.manager.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.qna.dao.ManagerQnaDAO;
import com.tumbler.manager.qna.vo.ManagerQnaVO;

@Service
public class ManagerQnaServiceImpl implements ManagerQnaService {
	@Autowired
	ManagerQnaDAO dao;
	@Override
	public List<ManagerQnaVO> mQnaList(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerQnaVO> list = null;
		list = dao.mQnaList(cri);
		return list;
	}
	@Override
	public int mQnaTotal() {
		// TODO Auto-generated method stub
		int total = dao.mQnaTotal();
		return total;
	}
	@Override
	public void mQnaRegist(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		dao.mQnaRegist(qvo);
	}
	@Override
	public List<ManagerQnaVO> mQnaNoticeList() {
		// TODO Auto-generated method stub
		List<ManagerQnaVO> list = null;
		list = dao.mQnaNoticeList();
		return list;
	}
	@Override
	public ManagerQnaVO mQnaNoticeDetail(int q_num) {
		// TODO Auto-generated method stub
		ManagerQnaVO qvo = new ManagerQnaVO();
		qvo = dao.mQnaNoticeDetail(q_num);
		return qvo;
	}
	@Override
	public void mQnaDelete(int q_num) {
		// TODO Auto-generated method stub
		dao.mQnaDelete(q_num);
	}
	@Override
	public ManagerQnaVO mQnaDetail(int q_num) {
		// TODO Auto-generated method stub
		return dao.mQnaDetail(q_num);
	}
	@Override
	public void mQnaReply(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		dao.mQnaReply(qvo);
	}
	@Override
	public List<ManagerQnaVO> mQnaReplyList(int q_num) {
		// TODO Auto-generated method stub
		List<ManagerQnaVO> list = null;
		list = dao.mQnaReplyList(q_num);
		return list;
	}
	@Override
	public void mQnaReplyEdit(ManagerQnaVO qvo) {
		// TODO Auto-generated method stub
		dao.mQnaReplyEdit(qvo);
	}
	@Override
	public void mQnaReplyDelete(int qr_num) {
		// TODO Auto-generated method stub
		dao.mQnaReplyDelete(qr_num);
	}
	@Override
	public void mQnaCount(int q_num) {
		// TODO Auto-generated method stub
		dao.mQnaCount(q_num);
	}
	@Override
	public List<ManagerQnaVO> mQnaSearch(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerQnaVO> list = dao.mQnaSearch(cri);
		return list;
	}
	@Override
	public int mQnaSearchedTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.mQnaSearchedTotal(cri);
	}
	@Override
	public List<ManagerQnaVO> mQnaNoticeSearch() {
		// TODO Auto-generated method stub
		List<ManagerQnaVO> list = dao.mQnaNoticeSearch();
		return list;
	}

}
