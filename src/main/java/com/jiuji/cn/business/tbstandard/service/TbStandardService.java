package com.jiuji.cn.business.tbstandard.service;

import java.util.List; 
import com.jiuji.cn.business.spcontact.model.SpContact;
import com.jiuji.cn.business.tbstandard.model.TbStandard;

import com.lanbao.base.PageData;
 

public interface TbStandardService {
 
	
	public void save(TbStandard tbStandard);

	public List<PageData> queryByProductId(PageData tproduct) throws Exception;

}
