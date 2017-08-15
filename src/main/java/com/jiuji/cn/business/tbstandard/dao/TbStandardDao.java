package com.jiuji.cn.business.tbstandard.dao;

import java.util.List;

import com.jiuji.cn.business.spcontact.model.SpContact;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.model.TCarousel;
import com.jiuji.cn.model.TClass;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao; 


public interface TbStandardDao  extends  BaseDao{
	
 
	List<PageData> queryByProductId(PageData tbStandard) throws Exception;
}
