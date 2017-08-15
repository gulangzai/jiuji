package com.jiuji.cn.business.tbproduct.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;





public interface TbProductService {

	
	/*
	* 新增
	*/
	public int save(PageData pd)throws Exception;
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception;
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception;
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception;
	
 
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception;
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	

	public List<PageData> findByClassId(Page page) throws Exception;

	public List<PageData> findNewHot() throws Exception;

	public PageData queryById(String f_ProductId) throws Exception;

	public List<PageData> queryByProduct(PageData tproduct)  throws Exception;

	public List<PageData> findNewGood() throws Exception;

	public List<PageData> findNewSpecial() throws Exception;

	public List<PageData> queryByParentSku(PageData tproduct)throws Exception;

	public List<PageData> findByColor(PageData tproduct)throws Exception;

	public List<PageData> findBySize(PageData tproduct)throws Exception;
 

	
}

