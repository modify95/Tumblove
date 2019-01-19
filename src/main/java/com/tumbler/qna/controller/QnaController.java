package com.tumbler.qna.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.client.page.Criteria;
import com.tumbler.client.page.PageDTO;
import com.tumbler.qna.service.QnaService;
import com.tumbler.qna.vo.QnaVO;

import lombok.extern.java.Log;

@Controller
@RequestMapping(value = "/qna")
@Log
public class QnaController {

   @Autowired
   private QnaService QnaService;

   @RequestMapping(value = "/qnaList", method = RequestMethod.GET)
   public String qnaList(@ModelAttribute QnaVO qvo, Model model, Criteria cri, HttpServletRequest request) {
      List<QnaVO> qnaList = null;
      int total = QnaService.cQnaTotal();
      
      if(cri == null) {
         qnaList = QnaService.cQnaList(new Criteria());
         model.addAttribute("pageMaker", new PageDTO(total, new Criteria()));
      }else{
         qnaList = QnaService.cQnaList(cri);
         model.addAttribute("pageMaker", new PageDTO(total, cri));
      }
      model.addAttribute("qnaList", qnaList);
      model.addAttribute("data", qvo);
      return "qna/qnaList";
   }

   @RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
   public String qnaDetail(@ModelAttribute QnaVO qvo, Model model) {
      log.info("qna Detail 호출성공");

      QnaVO detail = new QnaVO();
      detail = QnaService.cQnaDetail(qvo);

      if (detail != null && (!detail.equals(""))) {
         detail.setQ_content(detail.getQ_content().toString().replaceAll("\n", "<br>"));
      }

      model.addAttribute("detail", detail);

      return "qna/qnaDetail";
   }
   @RequestMapping(value = "/qnaRegist", method = RequestMethod.GET)
   public String qnaRegist(@ModelAttribute QnaVO qvo, Model model ) {
      
      
      return "qna/qnaRegist";
   }
   
   
   @RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
   public String qnaInsert(@ModelAttribute QnaVO qvo, Model model, HttpServletRequest request) {
      log.info("qna insert 호출성공");
      //HttpSession session = request.getSession();
      //String m_id = (String) session.getAttribute("m_id");

      int result = 0;
      String url = "";

      result = QnaService.cQnaInsert(qvo);
      if (result == 1) {
         url = "/qna/qnaList";
      } else {
         //model.addAttribute("code", 1);
         url = "/qna/qnaRegist";
      }
      return "redirect:" + url;
   }
   
   //검색 후 페이지 구현
   @RequestMapping(value = "/qnaSearch", method= RequestMethod.GET)
   public String qnaSearchPaging(Criteria cri, Model model) {
      log.info("qnaSearchPaging 호출 성공");
      
      List<QnaVO> qnaList = QnaService.cQnaSearchPaging(cri);
      int total = QnaService.cQnaSearchTotal(cri);
      model.addAttribute("qnaList", qnaList);
      model.addAttribute("pageMaker", new PageDTO(total, cri));
      log.info("total: " + total);
      return "qna/qnaList";
      
   }
   
   //글삭제 구현
   @RequestMapping(value = "/qnaDelete", method = RequestMethod.POST )
   public String qnaDelete(@ModelAttribute QnaVO qvo, Model model, Criteria cri) {
      log.info("qnaDelete 호출성공");
      
      int result = 0;
      
      result = QnaService.cQnaDelete(qvo.getQ_num());
      
      return "qna/qnaList";
   }
   
}