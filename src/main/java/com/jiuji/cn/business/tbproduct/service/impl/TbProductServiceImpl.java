package com.jiuji.cn.business.tbproduct.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbclass.vo.TbClass;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.business.tbproduct.service.TbProductService;
import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;



@Service("tbProductService")
public class TbProductServiceImpl implements TbProductService {

	@Autowired
	public TbProductDao tbProductDao;
	
	/*
	* 新增
	*/
	public int save(PageData pd)throws Exception{
		return (Integer) tbProductDao.mb_save("TbProductMapper.save", pd);
	}
	
	/*
	* 删除
	*/
	public void delete(PageData pd)throws Exception{
		tbProductDao.mb_delete("TbProductMapper.delete", pd);
	}
	
	/*
	* 修改
	*/
	public void edit(PageData pd)throws Exception{
		tbProductDao.mb_update("TbProductMapper.edit", pd);
	}
	
	/*
	*列表
	*/
	public List<PageData> list(Page page)throws Exception{ 
		return (List<PageData>)tbProductDao.mb_findForList("TbProductMapper.datalistPage", page);
	}
	
	public int datalistPageCount(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (int)tbProductDao.mb_findForObject("TbProductMapper.datalistPageCount", page); 
	} 
	
	/*
	*列表(全部)
	*/
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)tbProductDao.mb_findForList("TbProductMapper.listAll", pd);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findById(PageData pd)throws Exception{
		return (PageData)tbProductDao.mb_findForObject("TbProductMapper.findById", pd);
	}
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		tbProductDao.mb_delete("TbProductMapper.deleteAll", ArrayDATA_IDS);
	}

	public List<PageData> findByClassId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbProductDao.mb_findForList("TbProductMapper.findByClassId", page);
	}

	@Transactional  
	public List<PageData> findNewHot() throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)tbProductDao.mb_findForList("TbProductMapper.findNewHot", null);
	}

	@Transactional  
	@Override
	public PageData queryById(String f_ProductId) throws Exception {
		// TODO Auto-generated method stub 
		return (PageData)tbProductDao.mb_findForObject("TbProductMapper.queryById", f_ProductId);
	}

	@Override
	public List<PageData> queryByProduct(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub 
		List<PageData> pictures = new ArrayList();//(List<PageData>)tbProductDao.mb_findForList("TbProductMapper.queryByProduct", tproduct);
		PageData F_PATH = new PageData();
		F_PATH.put("PATH", tproduct.getString("F_PATH"));
		pictures.add(F_PATH);
		for(int i=1;i<=8;i++){
			if(tproduct.getString("F_PATH"+i)!=null){
				F_PATH = new PageData();
				String fpath_index = tproduct.getString("F_PATH"+i);
				F_PATH.put("PATH", tproduct.getString("F_PATH"+i));
				if(fpath_index!=null&&!"".equals(tproduct.getString("F_PATH"+i))){
					pictures.add(F_PATH);	
				} 
			}
		} 
		return pictures;
	}

	@Transactional
	@Override
	public List<PageData> findNewGood() throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.findNewGood();
	}
	
	

	@Override
	public List<PageData> findNewSpecial() throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.findNewSpecial();
	}

	@Override
	public List<PageData> queryByParentSku(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.queryByParentSku(tproduct);
	}

	@Override
	public List<PageData> findByColor(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.findByColor(tproduct);
	}

	@Override
	public List<PageData> findBySize(PageData tproduct) throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.findBySize(tproduct);
	}

	public List<PageData> findByClass(TbClass tbClass) throws Exception {
		// TODO Auto-generated method stub
		return tbProductDao.findByClass(tbClass);
	}
}

