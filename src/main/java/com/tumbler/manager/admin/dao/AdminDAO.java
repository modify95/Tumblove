package com.tumbler.manager.admin.dao;

import java.util.List;

import com.tumbler.manager.admin.vo.AdminVO;

public interface AdminDAO {
	public List<AdminVO> managerLogin(AdminVO avo);
}
