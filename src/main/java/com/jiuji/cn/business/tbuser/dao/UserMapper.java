package com.jiuji.cn.business.tbuser.dao;

import java.util.List;

import com.jiuji.cn.business.tbuser.model.TbUser;
 

public interface UserMapper {

	List<TbUser> select(TbUser t_user);
	
	TbUser selectOnlyone(TbUser tuser);

	void insert(TbUser tuser); 
}
