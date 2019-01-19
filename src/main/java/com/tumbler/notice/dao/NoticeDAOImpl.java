package com.tumbler.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.client.page.Criteria;
import com.tumbler.notice.vo.NoticeVO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession session;
	
	//공지사항 상세내용
	@Override
	public NoticeVO cNoticeDetail(NoticeVO nvo) {
		// TODO Auto-generated method stub
		return (NoticeVO)session.selectOne("cNoticeDetail", nvo);
	}
	//전체 공지사항

	@Override
	public List<NoticeVO> cNoticeList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("cNoticeList", cri);
	}
	
	//검색을 위한 전체 리스트
	@Override
	public List<NoticeVO> cNoticeSearchPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("cNoticeSearchPaging", cri);
	}
	//페이징을 위한 공지사항 total값
	@Override
	public int cNoticeTotal() {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("cNoticeTotal");
	}
	//검색을 위한 공지사항  total값
	@Override
	public int cNoticeSearchTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("cNoticeSearchTotal", cri);
	}
	
}
