package com.tumbler.manager.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.common.page.Criteria;
import com.tumbler.common.page.PageDTO;
import com.tumbler.manager.product.service.ManagerProductService;
import com.tumbler.manager.product.vo.ManagerProductVO;
import com.tumbler.manager.product.vo.UpdateProductVO;
import com.tumbler.util.ProductFileUploadUtil;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value="/manager/product")
public class ManagerProductController {
	@Autowired
	ManagerProductService service;
	
	@RequestMapping(value="/productList")
	public String managerProductList(Criteria cri, Model model) {
		log.info("Manager ProductList 호출 성공");
		List<ManagerProductVO> productList = service.managerProductList(cri);
		model.addAttribute("productList", productList);
		
		int total = service.mGetTotalCount(cri);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("total: " + total);
		
		return "manager/product/managerProductList";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String managerSearchProductList(Criteria cri, Model model) {
		log.info("Manager searchProductList 호출 성공");

		
		List<ManagerProductVO> productList = service.mSearchProductList(cri);
		int total = service.mGetSearchTotalCount(cri);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("total: " + total);
		return "manager/product/managerProductList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String managerProductDetail(ManagerProductVO mpvo, Model model) {
		log.info("Manager productDatail 호출 성공");
		ManagerProductVO product = service.mGetDetail(mpvo.getP_num());
		log.info(product.getP_num()+"");
		model.addAttribute("product", product);
		
		return "manager/product/managerProductDetail";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String managerProductUpdate(UpdateProductVO upvo, HttpServletRequest request) 
			throws IllegalStateException, IOException {
		ManagerProductVO mpvo = new ManagerProductVO();
		log.info("Manager productUpdate 호출 성공");
		
		 
	     
		 if (!upvo.getUfile1().isEmpty()) {
			 mpvo.setImage1(ProductFileUploadUtil.fileUpload(upvo.getUfile1(), request, "product"));
		 } else {
			 mpvo.setImage1(upvo.getUimage1());
		 }
		 if (!upvo.getUfile2().isEmpty()) {
			 mpvo.setImage2(ProductFileUploadUtil.fileUpload(upvo.getUfile2(), request, "product"));
		 } else {
			 mpvo.setImage2(upvo.getUimage2());
		 }
		 if (!upvo.getUfile3().isEmpty()) {
			 mpvo.setImage4(ProductFileUploadUtil.fileUpload(upvo.getUfile3(), request, "product"));
		 } else {
			 mpvo.setImage3(upvo.getUimage3());
		 }
		 if (!upvo.getUfile4().isEmpty()) {
			 mpvo.setImage4(ProductFileUploadUtil.fileUpload(upvo.getUfile4(), request, "product"));
		 } else {
			 mpvo.setImage4(upvo.getUimage4());
		 }
		 if (!upvo.getUfile5().isEmpty()) {
			 mpvo.setImage5(ProductFileUploadUtil.fileUpload(upvo.getUfile5(), request, "product"));
		 } else {
			 mpvo.setImage5(upvo.getUimage5());
		 }
		 
		 mpvo.setP_num(upvo.getUp_num());
		 mpvo.setP_name(upvo.getUp_name());
		 mpvo.setP_material(upvo.getUp_material());
		 mpvo.setP_category(upvo.getUp_category());
		 mpvo.setP_sub_category(upvo.getUp_sub_category());
		 mpvo.setP_price(upvo.getUp_price());
		 mpvo.setP_temperature(upvo.getUp_temperature());
		 mpvo.setP_stock(upvo.getUp_stock());
		 mpvo.setP_sales_volume(upvo.getUp_sales_volume());
		 mpvo.setP_capacity(upvo.getUp_capacity());
		 mpvo.setP_country(upvo.getUp_country());
		 mpvo.setP_color(upvo.getUp_color());
		 mpvo.setP_state(upvo.getUp_state());
		 mpvo.setI_num(upvo.getUi_num());
	
		 service.mUpdateProduct(mpvo);
	     service.mUpdateProduct_image(mpvo);
	     
		return "redirect:/manager/product/productList";
	}
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public String managerProductDelete(@ModelAttribute UpdateProductVO upvo, HttpServletRequest request) {
		log.info("manager productDelete 호출 성공");
	
		try {
			if (!upvo.getUimage1().isEmpty()) {
				ProductFileUploadUtil.fileDelete(upvo.getUimage1(), request);
			}
			if (!upvo.getUimage2().isEmpty()) {
				ProductFileUploadUtil.fileDelete(upvo.getUimage2(), request);
			}
			if (!upvo.getUimage3().isEmpty()) {
				ProductFileUploadUtil.fileDelete(upvo.getUimage3(), request);
			}
			if (!upvo.getUimage4().isEmpty()) {
				ProductFileUploadUtil.fileDelete(upvo.getUimage4(), request);
			}
			if (!upvo.getUimage5().isEmpty()) {
				ProductFileUploadUtil.fileDelete(upvo.getUimage5(), request);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ManagerProductVO mpvo = new ManagerProductVO();
		mpvo.setP_num(upvo.getUp_num());
		mpvo.setI_num(upvo.getUi_num());
		service.mDeleteProduct(mpvo);
		service.mDeleteProduct_image(mpvo);
		
		return "redirect:/manager/product/productList";
	}
	
	@RequestMapping(value = "/productInsert", method = RequestMethod.POST)
	public String productInsert(@ModelAttribute ManagerProductVO pvo, Model model, HttpServletRequest request)
	         throws IllegalStateException, IOException {
	      log.info("productInsert 호출 성공");

	      int result = 0;
	      String url = "";
	      String image = ProductFileUploadUtil.fileUpload(pvo.getFile(), request, "product");

	      pvo.setImage1(image);

	      String image2 = ProductFileUploadUtil.fileUpload(pvo.getFile2(), request, "product");

	      pvo.setImage2(image2);

	      String image3 = ProductFileUploadUtil.fileUpload(pvo.getFile3(), request, "product");

	      pvo.setImage3(image3);

	      String image4 = ProductFileUploadUtil.fileUpload(pvo.getFile4(), request, "product");

	      pvo.setImage4(image4);

	      String image5 = ProductFileUploadUtil.fileUpload(pvo.getFile5(), request, "product");

	      pvo.setImage5(image5);

	      result = service.mRegistProduct(pvo);

	      if (result == 1) {
	         url = "/manager/product/productList";
	      } else {
	         model.addAttribute("code", 1);
	         url = "/manager/product/productList";
	      }

	      return "redirect:" + url;
	 }
 }
