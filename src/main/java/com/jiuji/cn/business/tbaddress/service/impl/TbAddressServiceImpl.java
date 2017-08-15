package com.jiuji.cn.business.tbaddress.service.impl;

import java.util.List; 
import javax.annotation.Resource; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbaddress.dao.TbAddressDao;
import com.jiuji.cn.business.tbaddress.service.TbAddressService;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;



@Service("tbAddressService")
public class TbAddressServiceImpl implements TbAddressService {

	@Autowired
	public TbAddressDao tbAddressDao;
	
	/*
	* save
	*/
	public int save(PageData pd)throws Exception{
		 tbAddressDao.save("TbAddressMapper.save", pd);
		int F_ADDRESS_UID =  (int) pd.get("ID");
		return F_ADDRESS_UID;
	}
	
	/*
	* delete
	*/
	public void delete(PageData pd)throws Exception{
		tbAddressDao.delete("TbAddressMapper.delete", pd);
	}
	
	/*
	*edit
	*/
	public void edit(PageData pd)throws Exception{
		tbAddressDao.update("TbAddressMapper.edit", pd);
	}
	
	/*
	*list
	*/
	public List<PageData> list(Page page)throws Exception{ 
		return (List<PageData>)tbAddressDao.findForList("TbAddressMapper.datalistPage", page);
	}
	
	/*
	*myDataList
	*/
	public List<PageData> myDataList(Page page)throws Exception{ 
		return (List<PageData>)tbAddressDao.findForList("TbAddressMapper.myDatalistPage", page);
	}
	
	public int datalistPageCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (int)tbAddressDao.findForObject("TbAddressMapper.datalistPageCount", page); 
	} 
	
	/*
	*listAll
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)tbAddressDao.findForList("TbAddressMapper.listAll", pd);
	}
	
	/*
	*findById
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)tbAddressDao.findForObject("TbAddressMapper.findById", pd);
	}
	
	/*
	*deleteAll
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		tbAddressDao.delete("TbAddressMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByClassId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbAddressDao.findForList("TbAddressMapper.findByClassId", page);
	}

	public List<PageData> findNewHot(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbAddressDao.findForList("TbAddressMapper.findNewHot", page);
	}

	
}

