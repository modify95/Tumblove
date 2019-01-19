package com.tumbler.trading.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.member.vo.MemberVO;
import com.tumbler.product.vo.ProductVO;
import com.tumbler.trading.vo.Order_TradingVO;
import com.tumbler.trading.vo.TradingVO;

@Repository
public class TradingDAOImpl implements TradingDAO {
	
	@Autowired
	private SqlSession sql;

	@Override
	public ProductVO cartOrderList(int c_num) {
		// TODO Auto-generated method stub
		return sql.selectOne("cartOrderList", c_num);
	}

	@Override
	public ProductVO detailOrderList(int p_num) {
		// TODO Auto-generated method stub
		return sql.selectOne("detailOrderList", p_num);
	}

	@Override
	public int insertOrderTrading(Order_TradingVO otvo) {
		// TODO Auto-generated method stub
		return sql.insert("insertOrderTrading", otvo);
	}

	@Override
	public int insertTrading(TradingVO tvo) {
		// TODO Auto-generated method stub
		return sql.insert("insertTrading", tvo);
	}

	@Override
	public void updateMileage(MemberVO mvo) {
		// TODO Auto-generated method stub
		sql.update("updateMileage", mvo);
	}

}
