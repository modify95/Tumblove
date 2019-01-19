package com.tumbler.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tumbler.common.page.Criteria;
import com.tumbler.common.page.PageDTO;
import com.tumbler.product.serivice.ProductService;
import com.tumbler.product.vo.ProductVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/productList/{p_category}", method = RequestMethod.GET)
	public String productList(@PathVariable("p_category") String p_category, Criteria criteria,
			Model model) {
		log.info("Product List 호출 성공");
		log.info(p_category);

		log.info(criteria.getPageNum() + "");
		
		List<ProductVO> productList = productService.productBrandListWithPaging(criteria);
		int total = productService.getTotalCount(criteria);
		log.info("total: " + total);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
		return "product/productList";
	}
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public String productListWithPaging(Criteria criteria,
			Model model) {
		log.info("ProductListWithPaging 호출 성공");
	
		log.info(criteria.getPageNum() + "");
		
		List<ProductVO> productList = productService.productBrandListWithPaging(criteria);
		int total = productService.getTotalCount(criteria);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
		log.info("total: " + total);
		return "product/productList";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String productListSearchWithPaging(Criteria criteria,
			Model model) {
		log.info("ProductListSearchWithPaging 호출 성공");
		log.info(criteria.getPageNum() + "");
		
		List<ProductVO> productList = productService.productBrandListSearchWithPaging(criteria);
		int total = productService.getSearchTotalCount(criteria);
		model.addAttribute("productList", productList);
		model.addAttribute("pageMaker", new PageDTO(criteria, total));
		
		log.info("total: " + total);
		return "product/productList";
	}
	
	//상품상세 페이지 구현
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String productDetail(ProductVO pvo, Model model) {
		log.info("productDetail 호출성공");
		log.info("p_num =" +pvo.getP_num());
			
		ProductVO detail = productService.productDetail(pvo);
			
		model.addAttribute("detail", detail);
			
		return "product/productDetail";
	}	
}
