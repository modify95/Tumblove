package com.tumbler.qna.dao;

import java.util.List;

import com.tumbler.client.page.Criteria;
import com.tumbler.qna.vo.QnaVO;


public interface QnaDAO {
   public List<QnaVO> cQnaList(Criteria cri);
   public int cQnaTotal();
   public QnaVO cQnaDetail(QnaVO qvo);
   public int cQnaInsert(QnaVO qvo);
   public int cQnaSearchTotal(Criteria cri);
   public List<QnaVO> cQnaSearchPaging(Criteria cri);
   public int cQnaDelete(int q_num);
}