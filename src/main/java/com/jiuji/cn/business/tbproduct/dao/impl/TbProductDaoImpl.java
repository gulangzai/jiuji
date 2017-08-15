package com.jiuji.cn.business.tbproduct.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.impl.BaseDaoImpl;
import com.lanbao.mybatis.impl.MyBatisBaseDaoImpl;

@Repository
public class TbProductDaoImpl extends BaseDaoImpl implements TbProductDao{

	@Override
	public List<PageData> findNewGood() throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.findNewGood",null);
	}

	@Override
	public List<PageData> findNewHot()throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.findNewHot",null);
	}

	@Override
	public List<PageData> findNewSpecial()throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.findNewSpecial",null);
	}

	@Override
	public List<PageData> queryByType(TProduct tproduct) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.queryByType",tproduct);
	}

	@Override
	public List<PageData> queryByParentSku(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.queryByParentSku",tproduct);
	}

	@Override
	public List<PageData> findByColor(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.findByColor",tproduct);
	}

	@Override
	public List<PageData> findBySize(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbProductMapper.findBySize",tproduct);
	}

}
