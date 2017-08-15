package com.jiuji.cn.business.tbhot.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbhot.vo.TbHot;
import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.lanbao.base.Page;
import com.lanbao.base.PageData;



public interface TbHotService {

	
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

	public List<PageData> findBy(PageData queryProductPara) throws Exception;

	public int save(TbHot tbHot);

	public List<TbProduct> findNewHot();
	  

	
}

