package com.jiuji.cn.business.tbspecial.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jiuji.cn.business.tbhot.vo.TbHot;
import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.jiuji.cn.business.tbuser.model.TbUser;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 


public interface TbSpecialService{

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

	public List<TbProduct> findNewSpecial();
}
