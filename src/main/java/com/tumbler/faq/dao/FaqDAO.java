package com.tumbler.faq.dao;

import java.util.List;

import com.tumbler.client.page.Criteria;
import com.tumbler.faq.vo.FaqVO;



public interface FaqDAO {
	public FaqVO cFaqDetail(FaqVO fvo);
	public List<FaqVO> cFaqList(Criteria cri);
	public int cFaqTotal();
	public List<FaqVO> cFaqSearchPaging(Criteria cri);
	public int cFaqSearchTotal(Criteria cri);

}
