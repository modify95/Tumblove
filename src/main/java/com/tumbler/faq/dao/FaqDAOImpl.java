package com.tumbler.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.client.page.Criteria;
import com.tumbler.faq.vo.FaqVO;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	private SqlSession session;

	@Override
	public FaqVO cFaqDetail(FaqVO fvo) {
		return session.selectOne("cFaqDetail", fvo);
	}

	@Override
	public List<FaqVO> cFaqList(Criteria cri) {
		return session.selectList("cFaqList", cri);
	}

	@Override
	public int cFaqTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("cFaqTotal");
	}

	@Override
	public List<FaqVO> cFaqSearchPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("cFaqSearchPaging", cri);
	}

	@Override
	public int cFaqSearchTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne("cFaqSearchTotal", cri);
	}

}
