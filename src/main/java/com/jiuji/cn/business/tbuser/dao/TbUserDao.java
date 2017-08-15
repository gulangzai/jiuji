package com.jiuji.cn.business.tbuser.dao;

import java.util.List;

import com.jiuji.cn.business.tbuser.model.TbUser;

import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;

public interface TbUserDao extends BaseDao {
	
	 PageData  selectOnlyone(String tuser,String password) ;
 
	
	public List<PageData> select(PageData pd)throws Exception  ;


	List<PageData> checkUsername(PageData pd) throws Exception;
 
	List<PageData> checkEmail(PageData pd) throws Exception;
	
	List<PageData> checkMobile(PageData pd) throws Exception;
}
