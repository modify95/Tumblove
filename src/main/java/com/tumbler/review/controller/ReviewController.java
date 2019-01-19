package com.tumbler.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.review.file.FileUploadUtil;
import com.tumbler.review.page.Criteria;
import com.tumbler.review.page.PageDTO;
import com.tumbler.review.service.ReviewService;
import com.tumbler.review.vo.ReviewVO;

 @Controller
@RequestMapping("/review")
public class ReviewController {

   @Autowired
   private ReviewService service;

   @RequestMapping(value = "/reviewlist", method = RequestMethod.POST)
   public String reviewList(Model model, @RequestBody ReviewVO rvo, HttpSession session,HttpServletRequest request) {
      System.out.println("reviewList");
      Criteria cri = new Criteria();
      model.addAttribute("p_num", rvo.getP_num());
      
      cri.setPageNum(rvo.getPageNum());
      cri.setAmount(rvo.getAmount());
      
      List<ReviewVO> paging = service.reviewListWithPaging(cri);
      int score_five = service.score_five(rvo);
      int score_four = service.score_four(rvo);
      int score_three = service.score_three(rvo);
      int score_two = service.score_two(rvo);
      int score_one = service.score_one(rvo);
      double score_avg = service.score_avg(rvo);

      int all_score = score_five + score_four + score_three + score_two + score_one;
      
      double avgFive = (double)score_five / (double)all_score * 100;
      double avgFour = (double)score_four / (double)all_score * 100;
      double avgThree = (double)score_three / (double)all_score * 100;
      double avgTwo = (double)score_two / (double)all_score * 100;
      double avgOne = (double)score_one / (double)all_score * 100;
      System.out.println(rvo.getP_num()+ " " +rvo.getM_num()+" 1");
      int countTradingNumber = service.readTradingNumber(rvo).size();
   
      System.out.println(countTradingNumber);
      if (countTradingNumber < 1) {
         model.addAttribute("msg", "거래내역없음");
      } else if (session.getAttribute("m_id") != null) {
         ReviewVO countVO = new ReviewVO();
         countVO.setR_writer((String) session.getAttribute("m_id"));
         countVO.setP_num(rvo.getP_num());
         
         int idCount = service.reviewIdCount(countVO);
         model.addAttribute("idCount", idCount);
         model.addAttribute("msg", "거래내역있음");
      } 
      
      model.addAttribute("avgFive", avgFive);
      model.addAttribute("avgFour",avgFour);
      model.addAttribute("avgThree",avgThree);
      model.addAttribute("avgTwo",avgTwo);
      model.addAttribute("avgOne",avgOne);
      
      model.addAttribute("score_five", score_five);
      model.addAttribute("score_four", score_four);
      model.addAttribute("score_three", score_three);
      model.addAttribute("score_two", score_two);
      model.addAttribute("score_one", score_one);
      model.addAttribute("score_avg", score_avg);
      model.addAttribute("all_score", all_score);
      
      model.addAttribute("list", paging);
      model.addAttribute("pageMaker", new PageDTO(service.cCountReview(rvo.getP_num()), cri));
      
      ReviewVO data = new ReviewVO();
      data.setM_num(rvo.getM_num());
      data.setP_num(rvo.getP_num());
      model.addAttribute("reviewData",data);

      return "review/reviewList";
   }

   // 리뷰 등록
   @RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
   public String reviewInsert(@RequestBody ReviewVO rvo, HttpSession session, Model model, HttpServletRequest request)
         throws IllegalStateException, Exception {
      System.out.println("reviewInsert 호출 성공");
      
      rvo.setM_num((Integer)session.getAttribute("m_num"));
      List<ReviewVO> trading_number = service.readTradingNumber(rvo);
      int t_num = trading_number.get(0).getT_num();   
      int t_count = trading_number.size();
      rvo.setT_num(t_num);
      System.out.println(t_num);
      if(t_count > 0) {
         /*if (rvo.getFile() != null) {
            String r_image = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
            rvo.setR_image(r_image);
         }*/
         service.reviewInsert(rvo);
      } else {
         System.out.println("거래내역 없음");
      }
      Criteria cri = new Criteria();
      model.addAttribute("p_num", rvo.getP_num());
      
      cri.setPageNum(rvo.getPageNum());
      cri.setAmount(rvo.getAmount());
      
      List<ReviewVO> paging = service.reviewListWithPaging(cri);
      int score_five = service.score_five(rvo);
      int score_four = service.score_four(rvo);
      int score_three = service.score_three(rvo);
      int score_two = service.score_two(rvo);
      int score_one = service.score_one(rvo);
      double score_avg = service.score_avg(rvo);

      int all_score = score_five + score_four + score_three + score_two + score_one;
      
      double avgFive = (double)score_five / (double)all_score * 100;
      double avgFour = (double)score_four / (double)all_score * 100;
      double avgThree = (double)score_three / (double)all_score * 100;
      double avgTwo = (double)score_two / (double)all_score * 100;
      double avgOne = (double)score_one / (double)all_score * 100;
      System.out.println(rvo.getP_num()+ " " +rvo.getM_num()+" 1");
      int countTradingNumber = service.readTradingNumber(rvo).size();
   
      System.out.println(countTradingNumber);
      if (countTradingNumber < 1) {
         model.addAttribute("msg", "거래내역없음");
      } else if (session.getAttribute("m_id") != null) {
         ReviewVO countVO = new ReviewVO();
         countVO.setR_writer((String) session.getAttribute("m_id"));
         countVO.setP_num(rvo.getP_num());
         
         int idCount = service.reviewIdCount(countVO);
         model.addAttribute("idCount", idCount);
         model.addAttribute("msg", "거래내역있음");
      } 
      
      model.addAttribute("avgFive", avgFive);
      model.addAttribute("avgFour",avgFour);
      model.addAttribute("avgThree",avgThree);
      model.addAttribute("avgTwo",avgTwo);
      model.addAttribute("avgOne",avgOne);
      
      model.addAttribute("list", paging);
      model.addAttribute("pageMaker", new PageDTO(service.cCountReview(rvo.getP_num()), cri));
      
      model.addAttribute("score_five", score_five);
      model.addAttribute("score_four", score_four);
      model.addAttribute("score_three", score_three);
      model.addAttribute("score_two", score_two);
      model.addAttribute("score_one", score_one);
      model.addAttribute("score_avg", score_avg);
      model.addAttribute("all_score", all_score);
      
      ReviewVO data = new ReviewVO();
      data.setM_num(rvo.getM_num());
      data.setP_num(rvo.getP_num());
      model.addAttribute("reviewData",data);
      
      return "review/reviewList";
   }
   
   // 리뷰 수정
   @RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
   public String reviewUpdate(@RequestBody ReviewVO rvo, HttpSession session, Model model, HttpServletRequest request) throws Exception {
      System.out.println("reviewUpdate 출력 성공");
      String r_Image = "";

      /*if (!rvo.getFile().isEmpty()) {
         System.out.println("===========file=" + rvo.getFile().getOriginalFilename());
         if (rvo.getR_image() != null && rvo.getR_image() != "") {
            FileUploadUtil.fileDelete(rvo.getR_image(), request);
         }
         r_Image = FileUploadUtil.fileUpload(rvo.getFile(), request, "review");
         rvo.setR_image(r_Image);
      }
*/
      service.reviewUpdate(rvo);
      
      Criteria cri = new Criteria();
      model.addAttribute("p_num", rvo.getP_num());
      
      cri.setPageNum(rvo.getPageNum());
      cri.setAmount(rvo.getAmount());
      
      List<ReviewVO> paging = service.reviewListWithPaging(cri);
      int score_five = service.score_five(rvo);
      int score_four = service.score_four(rvo);
      int score_three = service.score_three(rvo);
      int score_two = service.score_two(rvo);
      int score_one = service.score_one(rvo);
      double score_avg = service.score_avg(rvo);

      int all_score = score_five + score_four + score_three + score_two + score_one;
      
      double avgFive = (double)score_five / (double)all_score * 100;
      double avgFour = (double)score_four / (double)all_score * 100;
      double avgThree = (double)score_three / (double)all_score * 100;
      double avgTwo = (double)score_two / (double)all_score * 100;
      double avgOne = (double)score_one / (double)all_score * 100;
      System.out.println(rvo.getP_num()+ " " +rvo.getM_num()+" 1");
      int countTradingNumber = service.readTradingNumber(rvo).size();
   
      System.out.println(countTradingNumber);
      if (countTradingNumber < 1) {
         model.addAttribute("msg", "거래내역없음");
      } else if (session.getAttribute("m_id") != null) {
         ReviewVO countVO = new ReviewVO();
         countVO.setR_writer((String) session.getAttribute("m_id"));
         countVO.setP_num(rvo.getP_num());
         
         int idCount = service.reviewIdCount(countVO);
         model.addAttribute("idCount", idCount);
         model.addAttribute("msg", "거래내역있음");
      } 
      model.addAttribute("avgFive", avgFive);
      model.addAttribute("avgFour",avgFour);
      model.addAttribute("avgThree",avgThree);
      model.addAttribute("avgTwo",avgTwo);
      model.addAttribute("avgOne",avgOne);
      
      model.addAttribute("list", paging);
      model.addAttribute("pageMaker", new PageDTO(service.cCountReview(rvo.getP_num()), cri));
      
      model.addAttribute("score_five", score_five);
      model.addAttribute("score_four", score_four);
      model.addAttribute("score_three", score_three);
      model.addAttribute("score_two", score_two);
      model.addAttribute("score_one", score_one);
      model.addAttribute("score_avg", score_avg);
      model.addAttribute("all_score", all_score);
      
      ReviewVO data = new ReviewVO();
      data.setM_num(rvo.getM_num());
      data.setP_num(rvo.getP_num());
      model.addAttribute("reviewData",data);

      return "review/reviewList";
   }

   // 리뷰 삭제
   @RequestMapping(value = "/reviewDelete", method = RequestMethod.POST)
   public String reviewDelete(@ModelAttribute ReviewVO rvo, HttpServletRequest request) throws Exception {
      System.out.println("reviewDelete 호출 성공");

      if (rvo.getR_image() != "" && rvo.getR_image() != null) {
         FileUploadUtil.fileDelete(rvo.getR_image(), request);
      }

      service.reviewDelete(rvo);

      return "review/reviewList";

   }
   

}