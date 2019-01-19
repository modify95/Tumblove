package com.tumbler.trading.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.vo.ProductVO;
import com.tumbler.trading.dao.TradingDAO;
import com.tumbler.trading.vo.Order_TradingVO;
import com.tumbler.trading.vo.TradingVO;

@Service
@Transactional
public class TradingServiceImpl implements TradingService {

	@Autowired
	private TradingDAO tradingDAO;

	@Override
	public ProductVO cartOrder(int c_num) {
		// TODO Auto-generated method stub
		return tradingDAO.cartOrderList(c_num);
	}

	@Override
	public ProductVO detailOrder(int p_num) {
		// TODO Auto-generated method stub
		return tradingDAO.detailOrderList(p_num);
	}

	@Override
	public int insertOrderTrading(Order_TradingVO otvo) {
		// TODO Auto-generated method stub
		return tradingDAO.insertOrderTrading(otvo);
	}

	@Override
	public int insertTrading(TradingVO tvo) {
		// TODO Auto-generated method stub
		return tradingDAO.insertTrading(tvo);
	}

	@Override
	public void updateMileage(MemberVO mvo) {
		// TODO Auto-generated method stub
		tradingDAO.updateMileage(mvo);
	}

}
