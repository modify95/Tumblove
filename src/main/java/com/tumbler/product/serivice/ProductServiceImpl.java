package com.tumbler.product.serivice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.common.page.Criteria;
import com.tumbler.product.dao.ProductDAO;
import com.tumbler.product.vo.ProductVO;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDao;

	@Override
	public List<ProductVO> productMainList(ProductVO pvo) {
		// TODO Auto-generated method stub
		List<ProductVO> mainList = null;
		mainList = productDao.productMainList(pvo);
		return mainList;
	}

	@Override
	public List<ProductVO> productBrandListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		List<ProductVO> brandList = null;
		brandList = productDao.productBrandListWithPaging(cri);
		return brandList;
	}

	@Override
	public List<ProductVO> productMainPopularList(ProductVO pvo) {
		// TODO Auto-generated method stub
		List<ProductVO> mainPopularList = null;
		mainPopularList = productDao.productMainPopularList(pvo);
		return mainPopularList;
	}

	@Override
	public List<ProductVO> productMainNew(ProductVO pvo) {
		// TODO Auto-generated method stub
		List<ProductVO> newProduct = null;
		newProduct = productDao.productMainNew(pvo);
		return newProduct;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		int total = productDao.getTotalCount(cri);
		return total;
	}

	@Override
	public List<ProductVO> productBrandListSearchWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		List<ProductVO> searchedList = null;
		searchedList = productDao.productBrandListSearchWithPaging(cri);
		return searchedList;
	}

	@Override
	public int getSearchTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		int total = productDao.getSearchTotalCount(cri);
		return total;
	}

	@Override
	public ProductVO productDetail(ProductVO pvo) {
		// TODO Auto-generated method stub
		ProductVO detail = null;
		detail = productDao.productDetail(pvo);
		return detail;
	}

}
