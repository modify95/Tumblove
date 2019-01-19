package com.tumbler.manager.notice.service;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.notice.vo.ManagerNoticeVO;

public interface ManagerNoticeService {
	public List<ManagerNoticeVO> noticeList(Criteria cri);
	public int noticeInsert(ManagerNoticeVO nvo);
	public ManagerNoticeVO noticeDetail(ManagerNoticeVO nvo);
	public int noticeDelete(int n_num);
	public int noticeCnt(int n_num);
	public int mNoticeTotal(Criteria cri);
	public List<ManagerNoticeVO> mNoticeSearch(Criteria cri);
	public int mNoticeSearchCount(Criteria cri);
}
