package com.jiuji.cn.business.tbproductattr.service;

import java.util.List;

import com.jiuji.cn.business.tbproductattr.vo.TbProductAttr;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;




public interface TbProductAttrService {

	
	/*
	* save
	*/
	public int save(PageData pd)throws Exception;
	
	/*
	* delete
	*/
	public void delete(PageData pd)throws Exception;
	
	/*
	* edit
	*/
	public void edit(PageData pd)throws Exception;
	
	/*
	*list
	*/
	public List<PageData> list(Page page)throws Exception;
	
	/*
	*listAll
	*/
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/*
	* ͨ��id��ȡ����
	*/
	public PageData findById(PageData pd)throws Exception;
	
	/*
	* deleteAll
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;

	public List<TbProductAttr> findBy(PageData tproduct) throws Exception;
	  

	
}

