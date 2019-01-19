package com.tumbler.manager.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.common.Criteria;
import com.tumbler.manager.notice.vo.ManagerNoticeVO;
@Repository
public class ManagerNoticeDAOImpl implements ManagerNoticeDAO{
	@Autowired SqlSession session;
	
	@Override
	public List<ManagerNoticeVO> noticeList(Criteria cri) {
		
		return session.selectList("noticeList", cri);
	}

	@Override
	public int noticeInsert(ManagerNoticeVO nvo) {
		
		return session.insert("noticeInsert" ,nvo);
	}

	@Override
	public ManagerNoticeVO noticeDetail(ManagerNoticeVO nvo) {
		
		return (ManagerNoticeVO)session.selectOne("noticeDetail",nvo);
	}

	@Override
	public int noticeDelete(int n_num) {
		
		return session.delete("noticeDelete", n_num);
	}

	@Override
	public int noticeCnt(int n_num) {
		
		return session.update("noticeCnt",n_num);
	}

	@Override
	public int mNoticeTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mNoticeTotal", cri);
	}

	@Override
	public List<ManagerNoticeVO> mNoticeSearch(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mNoticeSearch", cri);
	}

	@Override
	public int mNoticeSearchCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mNoticeSearchCount", cri);
	}
}
