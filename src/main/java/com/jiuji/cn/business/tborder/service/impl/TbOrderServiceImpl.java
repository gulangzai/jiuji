package com.jiuji.cn.business.tborder.service.impl;

import java.util.Date;
import java.util.List; 
import javax.annotation.Resource; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tborder.dao.TbOrderDao;
import com.jiuji.cn.business.tborder.service.TbOrderService;
import com.jiuji.cn.business.tborder.vo.TbOrder;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
 

@Service("tbOrderService")
public class TbOrderServiceImpl implements TbOrderService {

	@Autowired
	public TbOrderDao tbOrderDao;
	
	/*
	* save
	*/
	public int save(PageData pd)throws Exception{
	   tbOrderDao.mb_save("TbOrderMapper.save", pd); 
	   int F_ORDER_UID = (int) pd.get("F_ORDER_UID"); 
		return F_ORDER_UID;
	}
	
	/*
	* delete
	*/
	public void delete(PageData pd)throws Exception{
		tbOrderDao.mb_delete("TbOrderMapper.delete", pd);
	}
	
	/*
	*edit
	*/
	public void edit(PageData pd)throws Exception{
		tbOrderDao.mb_update("TbOrderMapper.edit", pd);
	}
	
	/*
	*list
	*/
	public List<PageData> list(Page page)throws Exception{ 
		return  (List<PageData>)tbOrderDao.mb_findForList("TbOrderMapper.datalistPage", page);
	}
	
	public int datalistPageCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (int)tbOrderDao.mb_findForObject("TbOrderMapper.datalistPageCount", page); 
	} 
	
	/*
	*listAll
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return null; //(List<PageData>)tbOrderDao.mb_findForList("TbOrderMapper.listAll", pd);
	}
	
	/*
	*findById
	*/
	public PageData findById(PageData pd)throws Exception{
		return null; //(PageData)tbOrderDao.mb_findForObject("TbOrderMapper.findById", pd);
	}
	
	/*
	*deleteAll
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		//tbOrderDao.mb_delete("TbOrderMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByClassId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;//(List<PageData>)tbOrderDao.mb_findForList("TbOrderMapper.findByClassId", page);
	}

	public List<PageData> findNewHot(Page page) throws Exception {
		// TODO Auto-generated method stub
		return null;//(List<PageData>)tbOrderDao.mb_findForList("TbOrderMapper.findNewHot", page);
	}

	
}

