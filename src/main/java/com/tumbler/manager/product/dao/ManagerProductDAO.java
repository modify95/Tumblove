package com.tumbler.manager.product.dao;

import java.util.List;

import com.tumbler.common.page.Criteria;
import com.tumbler.manager.product.vo.ManagerProductVO;

public interface ManagerProductDAO {
	public List<ManagerProductVO> managerProductList(Criteria cri);
	public int mGetTotalCount(Criteria cri);
	public List<ManagerProductVO> mSearchProductList(Criteria cri);
	public int mGetSearchTotalCount(Criteria cri);
	public ManagerProductVO mGetDetail(int p_num);
	public void mUpdateProduct(ManagerProductVO mpvo);
	public void mUpdateProduct_image(ManagerProductVO mpvo);
	public int mRegistProduct(ManagerProductVO mpvo);
	public void mDeleteProduct(ManagerProductVO mpvo);
	public void mDeleteProduct_image(ManagerProductVO mpvo);
}
