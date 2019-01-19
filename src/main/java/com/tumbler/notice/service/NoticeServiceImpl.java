package com.tumbler.notice.service;

import java.util.List;

import org.jfree.util.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.client.page.Criteria;
import com.tumbler.notice.dao.NoticeDAO;
import com.tumbler.notice.vo.NoticeVO;
@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public List<NoticeVO> cNoticeList(Criteria cri) {
		Log.info("get List with criteria: "  + cri);
		List<NoticeVO> List = null;
		List = noticeDao.cNoticeList(cri);
		return List;
	}

	@Override
	public List<NoticeVO> cNoticeSearchPaging(Criteria cri) {
		List<NoticeVO> searchPaging = noticeDao.cNoticeSearchPaging(cri);
		return searchPaging;
	}

	@Override
	public NoticeVO cNoticeDetail(NoticeVO nvo) {
		NoticeVO detail = null;
		detail = noticeDao.cNoticeDetail(nvo);
		return detail;
	}

	@Override
	public int cNoticeTotal() {
		int total = noticeDao.cNoticeTotal(); 
		return total;
	}

	@Override
	public int cNoticeSearchTotal(Criteria cri) {
		int searchTotal = noticeDao.cNoticeSearchTotal(cri);
		return searchTotal;
	}

}
