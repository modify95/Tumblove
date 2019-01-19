package com.tumbler.product.serivice;

import java.util.List;

import com.tumbler.common.page.Criteria;
import com.tumbler.product.vo.ProductVO;

public interface ProductService {
	public List<ProductVO> productMainList(ProductVO pvo);
	public List<ProductVO> productMainPopularList(ProductVO pvo);
	public List<ProductVO> productMainNew(ProductVO pvo);
	public List<ProductVO> productBrandListWithPaging(Criteria cri);
	public List<ProductVO> productBrandListSearchWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
	public int getSearchTotalCount(Criteria cri);
	public ProductVO productDetail(ProductVO pvo);
}
