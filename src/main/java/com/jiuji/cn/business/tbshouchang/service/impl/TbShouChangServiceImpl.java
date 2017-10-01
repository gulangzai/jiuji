package com.jiuji.cn.business.tbshouchang.service.impl;

import java.util.List; 
import javax.annotation.Resource; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbshopcar.dao.TbShopCarDao;
import com.jiuji.cn.business.tbshopcar.service.TbShopCarService;
import com.jiuji.cn.business.tbshouchang.dao.TbShouChangDao;
import com.jiuji.cn.business.tbshouchang.service.TbShouChangService;
import com.jiuji.cn.business.tbshouchang.vo.TbShouChang;
import com.lanbao.base.PageData; 
import com.lanbao.base.Page;


@Service("tbShouChangService")
public class TbShouChangServiceImpl implements TbShouChangService {

	@Autowired
	public TbShouChangDao tbShouChangDao;
	
	/*
	* save
	*/ 
	public int save(TbShouChang tbShouChang)throws Exception{
		int i = (int) tbShouChangDao.h_save(tbShouChang);
		//h_save("TbShouchangMapper.save", pd);
		//int F_SHOPCARDID = (int) pd.get("F_SHOUCHANG_UID");
		return i;
	}
	
	/*
	* delete
	*/
	public void delete(PageData pd)throws Exception{
		tbShouChangDao.mb_delete("TbShouchangMapper.delete", pd);
	}
	
	/*
	*edit
	*/
	public void edit(PageData pd)throws Exception{
		tbShouChangDao.mb_update("TbShopCarMapper.edit", pd);
	}
	
	/*
	*list
	*/
	public List<PageData> list(Page page)throws Exception{ 
		return (List<PageData>)tbShouChangDao.mb_findForList("TbShouchangMapper.datalistPage", page);
	}
	
	public int datalistPageCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (int)tbShouChangDao.mb_findForObject("TbShouchangMapper.datalistPageCount", page); 
	} 
	
	/*
	*listAll
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)tbShouChangDao.mb_findForList("TbShouchangMapper.listAll", pd);
	}
	
	/*
	*findById
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)tbShouChangDao.mb_findForObject("TbShouchangMapper.findById", pd);
	}
	
	/*
	*deleteAll
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		tbShouChangDao.mb_delete("TbShopCarMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByClassId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbShouChangDao.mb_findForList("TbShouchangMapper.findByClassId", page);
	}

	public List<PageData> findNewHot(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbShouChangDao.mb_findForList("TbShouchangMapper.findNewHot", page);
	}

	
}

