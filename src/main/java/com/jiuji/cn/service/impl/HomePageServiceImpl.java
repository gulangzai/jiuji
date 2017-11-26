package com.jiuji.cn.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.support.RequestContext;

import com.alibaba.fastjson.JSONArray;
import com.jiuji.cn.business.tbcarousel.dao.TbCarouselDao;
import com.jiuji.cn.business.tbclass.dao.TbClassDao;
import com.jiuji.cn.business.tbclass.vo.TbClass;
import com.jiuji.cn.business.tbhot.service.TbHotService;
import com.jiuji.cn.business.tbnotice.dao.TbNoticeDao;
import com.jiuji.cn.business.tbnotice.vo.TbNotice;
import com.jiuji.cn.business.tborder.dao.TbOrderDao;
import com.jiuji.cn.business.tbproduct.dao.TbProductDao;
import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.jiuji.cn.business.tbproduct.service.TbProductService;
import com.jiuji.cn.business.tbshopcar.service.TbShopCarService;
import com.jiuji.cn.business.tbspecial.dao.TbSpecialDao;
import com.jiuji.cn.business.tbspecial.service.TbSpecialService;
import com.jiuji.cn.service.HomePageService;
import com.lanbao.base.Page;
import com.lanbao.base.PageData;

import net.sf.json.JSONObject;

@Service
public class HomePageServiceImpl implements HomePageService {

	@Autowired
	TbShopCarService tbShopCarService;
	
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
	
	@Autowired
	TbNoticeDao tbNoticeDao;
	
	@Autowired
	TbOrderDao tbOrderDao;
	
	
	@Transactional(propagation=Propagation.REQUIRED)
	@Override
	public void queryInfomation(Model model, HttpSession session,HttpServletRequest req) {
		String F_USER_ID = (String) session.getAttribute("F_USER_ID");
		// TODO Auto-generated method stub
		//轮播图片
		try {
			List<PageData> tCarousels = tbCarouselDao.queryAll();
			model.addAttribute("tCarousels", tCarousels);
			
			
			Long start = System.currentTimeMillis();
			
			//类目
			List<PageData> tclasses = tbClassDao.queryAll();
			for (PageData tClass : tclasses) {
				tClass.put("sonTClasses",tbClassDao.queryAllson(tClass));
			}
			model.addAttribute("tclasses",tclasses);
			
			
			//首饰配件
			TbClass shoushi = new TbClass(106); 
			List<TbClass> shoushiList =  new ArrayList(); //tbClassDao.queryByParentClass(shoushi);
			shoushiList.add(new TbClass(108,"项链"));
			shoushiList.add(new TbClass(109,"耳饰"));
			shoushiList.add(new TbClass(289,"手链"));
			shoushiList.add(new TbClass(284,"太阳镜"));
			shoushiList.add(new TbClass(306,"徽章"));
			for (TbClass tClass : shoushiList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			} 
			model.addAttribute("shoushiClass",shoushiList);
		    
			//兴趣爱好
			List<TbClass> xinquaihaoList = new ArrayList();
			xinquaihaoList.add(new TbClass(333,"滑板车"));
			xinquaihaoList.add(new TbClass(348,"书籍"));
			xinquaihaoList.add(new TbClass(345,"DIY"));
			xinquaihaoList.add(new TbClass(178,"钉鞋"));
			xinquaihaoList.add(new TbClass(191,"运动鞋"));
			
			for (TbClass tClass : xinquaihaoList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			}
			model.addAttribute("xinquaihaoClass",xinquaihaoList);
			
			
			//精品上衣 
			List<TbClass> jinpingList =  new ArrayList(); //tbClassDao.queryByParentClass(shoushi);
			jinpingList.add(new TbClass(137,"毛衣"));
			jinpingList.add(new TbClass(138,"圆领上衣"));
			jinpingList.add(new TbClass(139,"冬装外套"));
			for (TbClass tClass : jinpingList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			} 
			model.addAttribute("jinpingClass",jinpingList);
			
			
			//潮鞋新尚
			List<TbClass> caoxiexinshangList = new ArrayList();
			caoxiexinshangList.add(new TbClass(175,"鱼嘴鞋"));
			caoxiexinshangList.add(new TbClass(176,"坡跟鞋"));
			caoxiexinshangList.add(new TbClass(177,"拖鞋"));
			caoxiexinshangList.add(new TbClass(178,"钉鞋"));
			caoxiexinshangList.add(new TbClass(191,"运动鞋"));
			
			for (TbClass tClass : caoxiexinshangList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			}
			model.addAttribute("caoxiexinshangClass",caoxiexinshangList);
			
			//化妆美容
			List<TbClass> huazhuangmeirongList = new ArrayList();
			huazhuangmeirongList.add(new TbClass(196,"丰唇膏"));
			huazhuangmeirongList.add(new TbClass(246,"假睫毛"));
			huazhuangmeirongList.add(new TbClass(245,"脱毛膏"));
			huazhuangmeirongList.add(new TbClass(211,"韩国美妆")); 
			for (TbClass tClass : huazhuangmeirongList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			}
			model.addAttribute("huazhuangmeirongClass",huazhuangmeirongList);
			
			
			//时尚炫酷
			List<TbClass> shishangxuankuList = new ArrayList();
			shishangxuankuList.add(new TbClass(273,"舞蹈服饰"));
			shishangxuankuList.add(new TbClass(256,"时尚套装"));
			shishangxuankuList.add(new TbClass(257,"沙滩装"));
			shishangxuankuList.add(new TbClass(258,"大码时尚"));
			shishangxuankuList.add(new TbClass(264,"COSPLAY"));
			for (TbClass tClass : shishangxuankuList) {
				tClass.setProducts(tbProductService.findByClass(tClass));
			}
			model.addAttribute("shishangxuankuClass",shishangxuankuList);
			
			
			
			 
			
			Long end1 = System.currentTimeMillis();
			
			//获取最新发布的5个商品
			List<PageData> tproducts = tbProductService.findNewGood();
			Long end2 = System.currentTimeMillis();
			
			//获取热门发布的5个商品
			List<TbProduct> tproductHots = tbHotService.findNewHot();
			Long end3 = System.currentTimeMillis();
			
			//获取特卖发布的5个商品
			List<TbProduct> tproductSpecials = tbSpecialService.findNewSpecial();
			Long end4 = System.currentTimeMillis();
			
			//获取最新的7条
			List<TbNotice> tbNotices = tbNoticeDao.findNewNotice();
			
			//获取我的订单
			 int myOrderNum	 = 0;
			if(F_USER_ID!=null){
				Page page = new Page();
				PageData pd = new PageData();
				pd.put("F_Status", "-1");
				pd.put("F_USER_ID", F_USER_ID);
				page.setPd(pd);
				List<PageData>  tbOrders  =  (List<PageData>) tbOrderDao.mb_findForList("TbOrderMapper.datalistPage", page);
				myOrderNum = tbOrders.size();
			}
			
			
			/**
			 * 我的购物车
			 */
			Page shopCar  = new Page();
			PageData pd = new PageData();
			pd.put("F_USER_ID", String.valueOf(session.getAttribute("F_USER_ID")));   
			shopCar.setPd(pd);
			List<PageData> shopCarList = tbShopCarService.list(shopCar);	 
			
			System.out.println("查询类型用时"+(end1-start));
			System.out.println("查询最新用时"+(end2-start));
			System.out.println("查询热门用时"+(end3-start));
			System.out.println("查询特卖用时"+(end4-start));
			
			model.addAttribute("myOrderNum", myOrderNum==0?"0":myOrderNum);
			model.addAttribute("tbNotices", tbNotices);
			model.addAttribute("tproducts",tproducts);
			model.addAttribute("tproductHots",tproductHots);
			model.addAttribute("tproductSpecials",tproductSpecials);
			model.addAttribute("shopCarList", JSONArray.toJSON(shopCarList));
			
			RequestContext rc = new RequestContext(req);
			//model.addAttribute("welcome", rc.getMessage);
			
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
