package com.jiuji.cn.business.pictures.dao;

import java.util.List;

import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;
import com.lanbao.dao.BaseDao;
import com.lanbao.mybatis.MyBatisBaseDao;

public interface TbPictureDao extends BaseDao{ 

	List<PageData> queryByProduct(PageData tproduct) throws Exception;
 

}
