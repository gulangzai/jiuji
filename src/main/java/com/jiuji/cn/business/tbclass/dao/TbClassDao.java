package com.jiuji.cn.business.tbclass.dao;
 

import java.util.List;

import com.jiuji.cn.business.tbclass.vo.TbClass;
import com.jiuji.cn.model.TClass;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;
import com.lanbao.mybatis.MyBatisBaseDao;

public interface TbClassDao extends  BaseDao{

	List<PageData> queryAll() throws Exception;

	Object queryAllson(PageData tClass) throws Exception;

	List<TbClass> queryByParentClass(TbClass shoushi)throws Exception;

	

}