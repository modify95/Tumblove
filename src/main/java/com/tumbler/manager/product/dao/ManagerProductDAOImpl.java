package com.tumbler.manager.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.common.page.Criteria;
import com.tumbler.manager.product.vo.ManagerProductVO;

@Repository
public class ManagerProductDAOImpl implements ManagerProductDAO {
	@Autowired
	SqlSession session;

	@Override
	public List<ManagerProductVO> managerProductList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("managerProductList", cri);
	}

	@Override
	public int mGetTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mGetTotalCount", cri);
	}

	@Override
	public List<ManagerProductVO> mSearchProductList(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("mSearchProductList", cri);
	}

	@Override
	public int mGetSearchTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("mGetSearchTotalCount", cri);
	}

	@Override
	public ManagerProductVO mGetDetail(int p_num) {
		// TODO Auto-generated method stub
		return session.selectOne("mGetDetail", p_num);
	}

	@Override
	public void mUpdateProduct(ManagerProductVO mpvo) {
		// TODO Auto-generated method stub
		session.update("mUpdateProduct", mpvo);
	}

	@Override
	public void mUpdateProduct_image(ManagerProductVO mpvo) {
		// TODO Auto-generated method stub
		session.update("mUpdateProduct_image", mpvo);
	}

	@Override
	public int mRegistProduct(ManagerProductVO mpvo) {
		return session.insert("mRegistProduct", mpvo);
	}

	@Override
	public void mDeleteProduct(ManagerProductVO mpvo) {
		// TODO Auto-generated method stub
		session.delete("mDeleteProduct", mpvo);
	}

	@Override
	public void mDeleteProduct_image(ManagerProductVO mpvo) {
		// TODO Auto-generated method stub
		session.delete("mDeleteProduct_image", mpvo);
	}
}
