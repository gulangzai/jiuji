package com.jiuji.cn.business.tbstandard.dao.impl;

import java.util.List;

import org.springframework.stereotype.Component;

import com.jiuji.cn.business.spcontact.model.SpContact;
import com.jiuji.cn.business.tbstandard.dao.TbStandardDao;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.model.TCarousel;
import com.jiuji.cn.model.TClass;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.impl.BaseDaoImpl; 

@Component(value="tbStandardDao")
public class TbStandardDaoImpl extends  BaseDaoImpl implements TbStandardDao {

	@Override
	public List<PageData> queryByProductId(PageData tbStandard) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbStandardMapper.queryByProductId",tbStandard);
	}

 
	
 
}
