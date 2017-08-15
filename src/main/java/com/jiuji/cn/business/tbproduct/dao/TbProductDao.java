package com.jiuji.cn.business.tbproduct.dao;

import java.util.List;

import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;
import com.lanbao.mybatis.MyBatisBaseDao;

public interface TbProductDao extends BaseDao{

	List<PageData> findNewGood() throws Exception;

	List<PageData> findNewHot() throws Exception;

	List<PageData> findNewSpecial() throws Exception;

	List<PageData> queryByType(TProduct tproduct) throws Exception;

	List<PageData> queryByParentSku(PageData tproduct) throws Exception;

	List<PageData> findByColor(PageData tproduct)throws Exception;

	List<PageData> findBySize(PageData tproduct)throws Exception;

}
