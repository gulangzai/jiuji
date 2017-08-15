package com.jiuji.cn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.pictures.dao.TbPictureDao;
import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TPicture;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.service.PictureService;

import com.lanbao.base.PageData;
@Service
public class PictureServiceImpl implements PictureService {

	/*@Autowired
	TPictureMapper tPictureMapper;*/
	
	@Autowired
	TbPictureDao tbPictureDao;
	
	@Override
	public List<PageData> queryByProduct(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return tbPictureDao.queryByProduct(tproduct);
	}

}
