package com.tumbler.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.client.page.Criteria;
import com.tumbler.faq.dao.FaqDAO;
import com.tumbler.faq.vo.FaqVO;
@Service
@Transactional
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO FaqDao;
	
	
	@Override
	public FaqVO cFaqDetail(FaqVO fvo) {
		FaqVO detail = null;
		detail = FaqDao.cFaqDetail(fvo);
		return detail;
	}

	@Override
	public List<FaqVO> cFaqList(Criteria cri) {
		List<FaqVO> List = null;
		List = FaqDao.cFaqList(cri);
		return List;
	}

	@Override
	public int cFaqTotal() {
				int total = FaqDao.cFaqTotal();
				return total;
	}

	@Override
	public List<FaqVO> cFaqSearchPaging(Criteria cri) {
		List<FaqVO> searchPaging = FaqDao.cFaqSearchPaging(cri); 
		return searchPaging;
	}

	@Override
	public int cFaqSearchTotal(Criteria cri) {
		int searchTotal = FaqDao.cFaqSearchTotal(cri);
		return searchTotal;
	}

}
