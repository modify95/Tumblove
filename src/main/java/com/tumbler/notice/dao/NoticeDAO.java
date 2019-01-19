package com.tumbler.notice.dao;

import java.util.List;

import com.tumbler.client.page.Criteria;
import com.tumbler.notice.vo.NoticeVO;

public interface NoticeDAO {
	public NoticeVO cNoticeDetail(NoticeVO nvo);
	public List<NoticeVO> cNoticeList(Criteria cri);
	public List<NoticeVO> cNoticeSearchPaging(Criteria cri);
	public int cNoticeTotal();
	public int cNoticeSearchTotal(Criteria cri);
}
