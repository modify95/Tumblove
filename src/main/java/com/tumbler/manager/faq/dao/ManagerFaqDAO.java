package com.tumbler.manager.faq.dao;

import java.util.List;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.faq.vo.ManagerFaqVO;

public interface ManagerFaqDAO {
	public void mFaqInsert(ManagerFaqVO fvo);
	public List<ManagerFaqVO> mFaqList(Criteria cri);
	public int mFaqTotal();
	public ManagerFaqVO mFaqDetail(int f_num);
	public void mFaqDelete(int f_num);
	public void mFaqReply(ManagerFaqVO fvo);
	public List<ManagerFaqVO> mFaqReplyList(int f_num);
	public void mFaqReplyEdit(ManagerFaqVO fvo);
	public void mFaqReplyDelete(int fr_num);
	public void mFaqReplyDeleteAll(int f_num);
	public void mFaqCount(int f_num);
	public List<ManagerFaqVO> mFaqSearch(Criteria cri);
	public int mFaqSearchedTotal(Criteria cri);
}
