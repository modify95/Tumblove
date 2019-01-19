package com.tumbler.trading.dao;

import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.vo.ProductVO;
import com.tumbler.trading.vo.Order_TradingVO;
import com.tumbler.trading.vo.TradingVO;

public interface TradingDAO {

	public ProductVO cartOrderList(int c_num);

	public ProductVO detailOrderList(int p_num);
	
	public int insertOrderTrading(Order_TradingVO otvo);
	
	public int insertTrading(TradingVO tvo);
	
	public void updateMileage(MemberVO mvo);

}
