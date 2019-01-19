package com.tumbler.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tumbler.cart.dao.CartDAO;
import com.tumbler.cart.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartVO> cartList(String m_id) {
		// TODO Auto-generated method stub
		return cartDAO.cartList(m_id);
	}

	@Override
	public CartVO cartInfo(int c_num) {
		// TODO Auto-generated method stub
		return cartDAO.cartInfo(c_num);
	}

	@Override
	public int editCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.editCart(cvo);
	}

	@Override
	public int deleteCart2(List<Integer> c_num) {
		// TODO Auto-generated method stub
		return cartDAO.deleteCart2(c_num);
	}

	@Override
	public int addCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return cartDAO.addCart(cvo);
	}

	@Override
	public int deleteCart1(int c_num) {
		// TODO Auto-generated method stub
		return cartDAO.deleteCart1(c_num);
	}

}
