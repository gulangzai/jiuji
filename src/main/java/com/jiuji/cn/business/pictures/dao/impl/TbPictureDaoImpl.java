package com.jiuji.cn.business.pictures.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiuji.cn.business.pictures.dao.TbPictureDao;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.impl.BaseDaoImpl;
import com.lanbao.mybatis.impl.MyBatisBaseDaoImpl;

@Repository
public class TbPictureDaoImpl extends BaseDaoImpl implements TbPictureDao{

  
	@Override
	public List<PageData> queryByProduct(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		List<PageData> pictures = new ArrayList(); //(List<PageData>) mb_findForList("TbPicturesMapper.queryByProduct",tproduct);
		for(int i=1;i<=8;i++){
			if(tproduct.getString("F_PATH"+i)!=null){
				PageData F_PATH = new PageData();
				F_PATH.put("PATH", tproduct.getString("F_PATH"+i));
				pictures.add(F_PATH);
			}
		} 
		
		return pictures;
	} 
}
