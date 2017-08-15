package com.jiuji.cn.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;

import com.lanbao.base.PageData;

public interface ProductService {

	TProduct queryById(String f_ProductId);

	List<PageData> queryByClsId(String f_clsId)throws Exception;

	JSONArray searchProduct(String term);

}
