package com.jiuji.cn.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.service.ProductService;

import com.lanbao.base.PageData;

@Service
public class ProductServiceImpl implements ProductService {

 	@Autowired
	TbProductDao tbProductDao; 
	
	@Override
	public TProduct queryById(String f_ProductId) {
		// TODO Auto-generated method stub
		TProduct tproduct = new TProduct(f_ProductId);
		return null; //tproductMapper.queryById(tproduct);
	}

	@Override
	public List<PageData> queryByClsId(String f_clsId) throws Exception {
		// TODO Auto-generated method stub
		TProduct tproduct = new TProduct();
		tproduct.setFClsId(Integer.parseInt(f_clsId));
		return tbProductDao.queryByType(tproduct); 
	}

	@Override
	public JSONArray searchProduct(String term) {
		// TODO Auto-generated method stub
		
        JSONArray array = new JSONArray();
		
		 
		TProduct tProduct = new TProduct();
		if(term!=null){
			tProduct.setFProductName(term.trim());
			List<HashMap> list = null;//tproductMapper.searchProduct(tProduct);
			if(list!=null){
				for (int i = 0; i < list.size(); i++) {
					HashMap map = list.get(i);
					JSONObject obj = new JSONObject();
					obj.put("id", map.get("F_ClsId"));
					obj.put("label","<div style='font-size:16px;'><span style='color:red'>"+map.get("F_ProductName")+"</span><div style='float:right'>约"+map.get("count")+"个结果</div></div>"); 
					obj.put("value", map.get("F_ProductName"));
					array.add(obj);
				}
			} 
		} 
		return array;
	}

}
