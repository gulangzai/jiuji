package com.jiuji.cn.business.tbhot.service.impl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbhot.dao.TbHotDao;
import com.jiuji.cn.business.tbhot.service.TbHotService;
import com.jiuji.cn.business.tbhot.vo.TbHot;
import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.lanbao.base.Page;
import com.lanbao.base.PageData;

@Service("tbHotService")
public class TbHotServiceImpl implements TbHotService{

	@Autowired
	TbHotDao tbHotDao;
	
	@Override
	public int save(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delete(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void edit(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PageData> list(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PageData> listAll(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<PageData> findBy(PageData queryProductPara) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int save(TbHot tbHot) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<TbProduct> findNewHot(){
		HashMap map = new HashMap(); 
		map.put("thstatus", "1");
		String sqlQueryString = "select  tp.*  from tb_hot th ,tb_product tp where th.f_sku = tp.f_sku AND th.F_STATUS = 1 AND tp.F_Status = 1 ORDER BY th.F_POWER DESC";
		SQLQuery sqlQuery = tbHotDao.h_createSQLQuery(sqlQueryString, map); 
		return sqlQuery.addEntity(TbProduct.class).list();
//	   return  sqlQuery.setResultTransformer(Transformers.aliasToBean(TbProduct.class)).list();
		//return sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list();
	}

}
