package com.tumbler.manager.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.notice.dao.ManagerNoticeDAO;
import com.tumbler.manager.notice.vo.ManagerNoticeVO;

@Service
@Transactional
public class ManagerNoticeServiceImpl implements ManagerNoticeService{
	@Autowired ManagerNoticeDAO managerNoticeDAO;
	
	@Override
	public List<ManagerNoticeVO> noticeList(Criteria cri) {
		List<ManagerNoticeVO> noticeList = null;
		
		noticeList = managerNoticeDAO.noticeList(cri);
		
		return noticeList;
	}

	@Override
	public int noticeInsert(ManagerNoticeVO nvo) {
		int result = 0;
		try {
		result = managerNoticeDAO.noticeInsert(nvo);
		}catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public ManagerNoticeVO noticeDetail(ManagerNoticeVO nvo) {
		ManagerNoticeVO detail = null;
		detail = managerNoticeDAO.noticeDetail(nvo);
		return detail;
	}

	@Override
	public int noticeDelete(int n_num) {
		int result = 0;
		
		try {
			result = managerNoticeDAO.noticeDelete(n_num);
		}catch(Exception e){
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

	@Override
	public int noticeCnt(int n_num) {
		int result = 0;
		try {
			result = managerNoticeDAO.noticeCnt(n_num);
		}catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
	}

	@Override
	public int mNoticeTotal(Criteria cri) {
		// TODO Auto-generated method stub
		int total = managerNoticeDAO.mNoticeTotal(cri);
		return total;
	}

	@Override
	public List<ManagerNoticeVO> mNoticeSearch(Criteria cri) {
		// TODO Auto-generated method stub
		List<ManagerNoticeVO> list = managerNoticeDAO.mNoticeSearch(cri);
		return list;
	}

	@Override
	public int mNoticeSearchCount(Criteria cri) {
		// TODO Auto-generated method stub
		return managerNoticeDAO.mNoticeSearchCount(cri);
	}
	
}
