package com.tumbler.manager.qna.dao;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.qna.vo.ManagerQnaVO;

public interface ManagerQnaDAO {
	public List<ManagerQnaVO> mQnaList(Criteria cri);
	public int mQnaTotal();
	public void mQnaRegist(ManagerQnaVO qvo);
	public List<ManagerQnaVO> mQnaNoticeList();
	public ManagerQnaVO mQnaNoticeDetail(int q_num);
	public void mQnaDelete(int q_num);
	public ManagerQnaVO mQnaDetail(int q_num);
	public void mQnaReply(ManagerQnaVO qvo);
	public List<ManagerQnaVO> mQnaReplyList(int q_num);
	public void mQnaReplyEdit(ManagerQnaVO qvo);
	public void mQnaReplyDelete(int qr_num);
	public void mQnaCount(int q_num);
	public List<ManagerQnaVO> mQnaSearch(Criteria cri);
	public int mQnaSearchedTotal(Criteria cri);
	public List<ManagerQnaVO> mQnaNoticeSearch();
}
