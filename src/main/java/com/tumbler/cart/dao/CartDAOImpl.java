package com.tumbler.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.cart.vo.CartVO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	private SqlSession sql;

	@Override
	public List<CartVO> cartList(String m_id) {
		// TODO Auto-generated method stub
		return sql.selectList("cartList", m_id);
	}

	@Override
	public CartVO cartInfo(int c_num) {
		// TODO Auto-generated method stub
		return sql.selectOne("cartInfo", c_num);
	}

	@Override
	public int editCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return sql.update("editCart", cvo);
	}

	@Override
	public int deleteCart2(List<Integer> c_num) {
		// TODO Auto-generated method stub
		return sql.delete("deleteCart2", c_num);
	}

	@Override
	public int addCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return sql.insert("addCart", cvo);
	}

	@Override
	public int deleteCart1(int c_num) {
		// TODO Auto-generated method stub
		return sql.delete("deleteCart1", c_num);
	}

}
