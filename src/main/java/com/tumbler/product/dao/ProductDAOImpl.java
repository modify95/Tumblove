package com.tumbler.product.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.common.page.Criteria;
import com.tumbler.product.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	@Autowired
	private SqlSession session;

	@Override
	public List<ProductVO> productMainList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("productMainList",pvo);
	}

	@Override
	public List<ProductVO> productBrandListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("productBrandListWithPaging", cri);
	}

	@Override
	public List<ProductVO> productMainPopularList(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("productMainPopularList", pvo);
	}

	@Override
	public List<ProductVO> productMainNew(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("productMainNew", pvo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("getTotalCount", cri);
	}

	@Override
	public List<ProductVO> productBrandListSearchWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return session.selectList("productBrandListSearchWithPaging", cri);
	}

	@Override
	public int getSearchTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("getSearchTotalCount", cri);
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		return session.selectOne("productDetail", pvo);
	}

}
