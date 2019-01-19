package com.tumbler.qna.service;

import java.util.List;

import com.tumbler.client.page.Criteria;
import com.tumbler.qna.vo.QnaVO;

public interface QnaService {
	  public List<QnaVO> cQnaList(Criteria cri);
	   public int cQnaTotal();
	   public QnaVO cQnaDetail(QnaVO qvo);
	   public int cQnaInsert(QnaVO qvo);
	   public int cQnaSearchTotal(Criteria cri);
	   public List<QnaVO> cQnaSearchPaging(Criteria cri);
	   public int cQnaDelete(int q_num);
}
