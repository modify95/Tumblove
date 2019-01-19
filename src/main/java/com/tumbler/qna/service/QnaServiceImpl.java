package com.tumbler.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.client.page.Criteria;
import com.tumbler.qna.dao.QnaDAO;
import com.tumbler.qna.vo.QnaVO;
@Service
@Transactional
public class QnaServiceImpl implements QnaService{

   @Autowired
   private QnaDAO QnaDao;
   
   @Override
   public List<QnaVO> cQnaList(Criteria cri) {
      List<QnaVO> list = null;
      list =  QnaDao.cQnaList(cri);
      return list;
   }

   @Override
   public QnaVO cQnaDetail(QnaVO qvo) {
      QnaVO detail = QnaDao.cQnaDetail(qvo);
      return detail;
   }

   @Override
   public int cQnaInsert(QnaVO qvo) {
      int result = 0;
      try {
         result =QnaDao.cQnaInsert(qvo);
      }catch(Exception e) {
         e.printStackTrace();
         result = 0;
      }
      return result;
   }

   @Override
   public int cQnaTotal() {
      int total = QnaDao.cQnaTotal();
      return total;
   }

   @Override
   public int cQnaSearchTotal(Criteria cri) {
      int searchTotal = QnaDao.cQnaSearchTotal(cri);
      return searchTotal;
   }

   @Override
   public List<QnaVO> cQnaSearchPaging(Criteria cri) {
      List<QnaVO> qnaSearchPaging = QnaDao.cQnaSearchPaging(cri);
      return qnaSearchPaging;
   }

   @Override
   public int cQnaDelete(int q_num) {
      int delete = 0;
      try {
         delete = QnaDao.cQnaDelete(q_num);
      }catch(Exception e) {
         e.printStackTrace();
         delete = 0;
      }
      
      return delete;
   }
}