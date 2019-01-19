package com.tumbler.notice.service;

import java.util.List;

import com.tumbler.client.page.Criteria;
import com.tumbler.notice.vo.NoticeVO;

public interface NoticeService {
		//public List<NoticeVO> noticeList();
		public List<NoticeVO> cNoticeList(Criteria cri);
		public List<NoticeVO> cNoticeSearchPaging(Criteria cri);
		public NoticeVO cNoticeDetail(NoticeVO nvo);
		public int cNoticeTotal();
		public int cNoticeSearchTotal(Criteria cri);
		
	}

