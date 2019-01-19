package com.tumbler.manager.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tumbler.manager.admin.dao.AdminDAO;
import com.tumbler.manager.admin.vo.AdminVO;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDao;

	@Override
	public List<AdminVO> managerLogin(AdminVO avo) {
		// TODO Auto-generated method stub
		List<AdminVO> admin = null;
		admin = adminDao.managerLogin(avo);
		return admin;
	}

}
