package com.jiuji.cn.business.tbstandard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbstandard.dao.TbStandardDao;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.business.tbstandard.service.TbStandardService;

import com.lanbao.base.PageData;
 

@Service("tbStandardService")
public class TbStandardServiceImpl  implements TbStandardService {

 	@Autowired
	TbStandardDao tbStandardDao; 
	  
	@Override
	public void save(TbStandard tbStandard) {
		// TODO Auto-generated method stub
		//tbStandardMapper.insert(tbStandard); 
	}

	@Override
	public List<PageData> queryByProductId(PageData tbStandard) throws Exception {
		// TODO Auto-generated method stub
		return tbStandardDao.queryByProductId(tbStandard);
	}
 

}
