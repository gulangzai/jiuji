package com.jiuji.cn.service.impl;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.jiuji.cn.business.tbcarousel.dao.TbCarouselDao;
import com.jiuji.cn.business.tbclass.dao.TbClassDao;
import com.jiuji.cn.business.tbhot.service.TbHotService;
import com.jiuji.cn.business.tbhot.vo.TbHot;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.jiuji.cn.business.tbproduct.service.TbProductService;
import com.jiuji.cn.business.tbspecial.dao.TbSpecialDao;
import com.jiuji.cn.business.tbspecial.service.TbSpecialService;
import com.jiuji.cn.model.TCarousel;
import com.jiuji.cn.model.TClass;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.service.HomePageService;

import com.lanbao.base.PageData;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.List;

@Service
public class HomePageServiceImpl implements HomePageService {

	@Autowired
	TbCarouselDao tbCarouselDao;
	
	@Autowired
	TbClassDao tbClassDao;
	
	@Autowired
	TbProductDao tbProductDao;
	 
	@Autowired
	TbProductService  tbProductService;
	
	@Autowired
	TbHotService tbHotService;
	
	@Autowired
	TbSpecialService tbSpecialService;
	
	@Autowired
	TbSpecialDao tbSpecialDao;
	
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void queryInfomation(Model model, HttpSession session) {
		// TODO Auto-generated method stub
		//轮播图片
		try {
			List<PageData> tCarousels = tbCarouselDao.queryAll();
			model.addAttribute("tCarousels", tCarousels);
			
			//类目
			List<PageData> tclasses = tbClassDao.queryAll();
			for (PageData tClass : tclasses) {
				tClass.put("sonTClasses",tbClassDao.queryAllson(tClass));
			}
			model.addAttribute("tclasses",tclasses);
			
			//获取最新发布的5个商品
			List<PageData> tproducts = tbProductService.findNewGood();
			//获取热门发布的5个商品
			List<TbProduct> tproductHots = tbHotService.findNewHot();
			
			//获取特卖发布的5个商品
			List<TbProduct> tproductSpecials = tbSpecialService.findNewSpecial();
			 
			model.addAttribute("tproducts",tproducts);
			model.addAttribute("tproductHots",tproductHots);
			
			model.addAttribute("tproductSpecials",tproductSpecials);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}


	@Override
	public void queryClassInfomation(Model model, HttpSession session) {
		// TODO Auto-generated method stub
		//类目
		try {
			List<PageData> tclasses = tbClassDao.queryAll();
			for (PageData tClass : tclasses) {
				tClass.put("sonTClasses",tbClassDao.queryAllson(tClass));
			}
			model.addAttribute("tclasses",tclasses); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
