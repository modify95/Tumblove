package com.tumbler.trading.service;

import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.vo.ProductVO;
import com.tumbler.trading.vo.Order_TradingVO;
import com.tumbler.trading.vo.TradingVO;

public interface TradingService {

	public ProductVO cartOrder(int c_num);

	public ProductVO detailOrder(int p_num);

	public int insertOrderTrading(Order_TradingVO otvo);

	public int insertTrading(TradingVO tvo);
	
	public void updateMileage(MemberVO mvo);

}
