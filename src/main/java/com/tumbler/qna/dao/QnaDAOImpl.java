package com.tumbler.qna.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.client.page.Criteria;
import com.tumbler.qna.vo.QnaVO;
@Repository
public class QnaDAOImpl implements QnaDAO{
   
   @Autowired
   private SqlSession session;
   
   @Override
   public List<QnaVO> cQnaList(Criteria cri) {
      return session.selectList("cQnaList", cri);
   }

   @Override
   public QnaVO cQnaDetail(QnaVO qvo) {
      return session.selectOne("cQnaDetail", qvo);
   }

   @Override
   public int cQnaInsert(QnaVO qvo) {
      return session.insert("cQnaInsert", qvo);
   }

   @Override
   public int cQnaTotal() {
      return session.selectOne("cQnaTotal");
   }

   @Override
   public int cQnaSearchTotal(Criteria cri) {
      return session.selectOne("cQnaSearchTotal", cri);
   }

   @Override
   public List<QnaVO> cQnaSearchPaging(Criteria cri) {
      return session.selectList("cQnaSearchPaging", cri);
   }

   @Override
   public int cQnaDelete(int q_num) {
      return session.delete("cQnaDelete", q_num);
   }


   


}