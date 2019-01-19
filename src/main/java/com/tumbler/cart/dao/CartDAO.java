package com.tumbler.cart.dao;

import java.util.List;

import com.tumbler.cart.vo.CartVO;

public interface CartDAO {

	public List<CartVO> cartList(String m_id);
	
	public CartVO cartInfo(int c_num);
	
	public int editCart(CartVO cvo);
	
	public int deleteCart1(int c_num);
	
	public int deleteCart2(List<Integer> c_num);
	
	public int addCart(CartVO cvo);
	
}
