package com.jiuji.cn.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiuji.cn.business.tbclass.dao.TbClassDao;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.service.ProductService;

import com.lanbao.base.PageData;
import com.lanbao.solr.SolrOperator;

@Service
public class ProductServiceImpl implements ProductService {

 	@Autowired
	TbProductDao tbProductDao;
 	
 	@Autowired
 	TbClassDao tbClassDao;
	
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
	public JSONArray searchProduct(String term) throws Exception {
		// TODO Auto-generated method stub
		
		
        JSONArray array = new JSONArray(); 
		TProduct tProduct = new TProduct();
		if(term!=null){
			tProduct.setFProductName(term.trim());
			/**
			 * 数据库搜索
			 */
			//List<HashMap> list =tbProductDao.searchProduct(tProduct);
			/**
			 * solr搜索
			 */
			List<Map> list = SolrOperator.groupQuery("F_ProductName_tk", term,tbClassDao);
			if(list!=null){
				for (int i = 0; i < list.size(); i++) {
					HashMap map = (HashMap) list.get(i);
					JSONObject obj = new JSONObject();
					obj.put("id", map.get("F_ClsId"));
					obj.put("label","<div style='width:500px;height:30px;line-height:30px;font-size:16px;'><div style='color:red;float:left'>"+map.get("F_ClsName")+"</div>&nbsp;<div style='width:320px;height:30px;float:left;color:blue;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;'>"+map.get("F_ProductName")+"</div><div style='float:right;'>约"+map.get("count")+"个宝贝</div></div>"); 
					obj.put("value", map.get("F_ClsName"));
					array.add(obj);
				}
			} 
		} 

		return array;
	}

}
