package com.tumbler.manager.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tumbler.manager.admin.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession session;

	@Override
	public List<AdminVO> managerLogin(AdminVO avo) {
		// TODO Auto-generated method stub
		return session.selectList("managerLogin", avo);
	}

}
