package com.jiuji.cn.service;

import java.util.List;

import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TPicture;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;

import com.lanbao.base.PageData;

public interface PictureService {

	List<PageData> queryByProduct(PageData tproduct) throws Exception;

}
