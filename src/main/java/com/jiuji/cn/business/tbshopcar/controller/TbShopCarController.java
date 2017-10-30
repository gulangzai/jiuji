package com.jiuji.cn.business.tbshopcar.controller; 
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiuji.cn.business.pictures.service.TbPicturesService;
import com.jiuji.cn.business.tbaddress.service.TbAddressService;
import com.jiuji.cn.business.tbshopcar.service.TbShopCarService;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction;
import com.lanbao.controller.BaseController;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject; 

/** 
 *  TbShopCarController
 * 
 */
@Controller
@RequestMapping(value="/tbshopcar/tbShopCarController")
public class TbShopCarController extends BaseController {
	
	String menuUrl = "tbshopcar/tbShopCarController/list.do";  
	
	@Resource(name="tbShopCarService")
	private TbShopCarService tbShopCarService;
	
	@Resource(name="tbPicturesService")
	private TbPicturesService tbPicturesService;
	
	@Autowired
	TbAddressService tbAddressService;
	
	 
	 
	/**
	 * save
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ResultAction save(HttpSession session) throws Exception{ 
		logBefore(logger, "TbShopCarController");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();   
	    pd.put("F_USER_ID", session.getAttribute("F_USER_ID").toString());
		double F_SinglePrice = Double.parseDouble((String)pd.get("F_SinglePrice"));
	    int F_BuyCount = Integer.parseInt((String)pd.get("F_NUMBER"));
	    double F_Express = Double.parseDouble((String)pd.getString("F_Express"));
		pd.put("F_COST", F_SinglePrice*F_BuyCount+F_Express);
		pd.put("CREATE_DATE",new Date());
		int F_SHOPCARDID = tbShopCarService.save(pd);
		
		HttpServletRequest request = this.getRequest();
		/*String[] PICTURES_IDs = request.getParameterValues("PICTURES_ID");
		if(!"".equals(PICTURES_IDs)&&PICTURES_IDs!=null){
			for(int i=0;i<PICTURES_IDs.length;i++){
				//存图片
				pd.put("PICTURES_ID", PICTURES_IDs[i]);
				PageData picture = tbPicturesService.findById(pd); 
				picture.put("TABLE_NAME", "TB_SHOPCAR");			 
				picture.put("TABLE_UID_VALUE",F_SHOPCARDID);						  
				tbPicturesService.update(picture);
			} 
		}*/
		
	    com.lanbao.base.ResultAction ra = new com.lanbao.base.ResultAction();
		ra.setIserror(false);
		return ra;
	}
	
	/**
	 * delete
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public ResultAction delete(){
		logBefore(logger, "TbShopCarController");
		ResultAction ra = new ResultAction(); 
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			tbShopCarService.delete(pd); 
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		ra.setIserror(false);
		return ra;
	}
	
	/**
	 * edit
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public ResultAction edit(HttpServletRequest request) throws Exception{
	    ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
	    tbShopCarService.edit(pd); 
	     String[] PICTURES_IDs = request.getParameterValues("PICTURES_ID");
		if(!"".equals(PICTURES_IDs)&&PICTURES_IDs!=null){
			for(int i=0;i<PICTURES_IDs.length;i++){
				//存图片
				pd.put("PICTURES_ID", PICTURES_IDs[i]);
				PageData picture = tbPicturesService.findById(pd); 
				picture.put("TABLE_NAME", "TB_SHOPCAR");			 
				picture.put("TABLE_UID_VALUE",pd.getString("F_SHOPCARDID"));						  
				tbPicturesService.update(picture);
			} 
		}
		
		com.lanbao.base.ResultAction ra = new com.lanbao.base.ResultAction();
		ra.setIserror(false);
		return ra;
	}
	
	 /**
	 * list
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,HttpSession session){
		logBefore(logger, "TbShopCarController");  
		ModelAndView mv = this.getModelAndView(); 
		PageData pd = this.getPageData();
		List<PageData>	varList  = null;
		Page pageAddress = new Page();
		List<PageData>	addressList  = null;
		try{
			pd.put("F_USER_ID", session.getAttribute("F_USER_ID").toString());
			page.setPd(pd);   
			varList = tbShopCarService.list(page);	 
			page.setData(varList);  
			
		
			try {
				addressList = tbAddressService.myDataList(page);
	 		} catch (Exception e) {
	 			// TODO Auto-generated catch block
	 			e.printStackTrace();
	 		}	 
	 		page.setData(varList);  
	 		pageAddress.setData(addressList);
			mv.setViewName("/modules/tbshopcar/tb_shopcar_my"); 
			mv.addObject("page", page);
			mv.addObject("pageAddress",pageAddress);
		} catch(Exception e){
			logger.error(e.toString(), e);
		} 
		return mv;
	}
	
	 /**
		 * list
		 */
		@RequestMapping(value="/wapjiujiList")
		public ModelAndView wapjiujiList(Page page,HttpSession session,HttpServletRequest request){
			logBefore(logger, "TbShopCarController");  
			ModelAndView mv = this.getModelAndView(); 
			PageData pd = this.getPageData();
			List<PageData>	varList  = null;
			try{
				pd.put("F_USER_ID", request.getParameter("F_USER_ID"));
				page.setPd(pd);   
				varList = tbShopCarService.list(page);	 
				page.setData(varList);  
				mv.setViewName("/wapjiuji/shoppingcar/shoppingcar_my"); 
				mv.addObject("page", page);
				
			} catch(Exception e){
				logger.error(e.toString(), e);
			} 
			return mv;
		}
	
	
	
  
	/**
	 * dataList
	 */
	@RequestMapping(value="/dataList")
	@ResponseBody
	public ModelAndView dataList(HttpSession session){
		logBefore(logger, "TbShopCarController");  
		ModelAndView mv = this.getModelAndView();
		Page page =  new Page(); 
		PageData pd = this.getPageData();
		List<PageData>	varList  = null;
		try{
			pd.put("F_USER_ID",session.getAttribute("F_USER_ID").toString());
			page.setPd(pd);   
			varList = tbShopCarService.list(page);	 
			page.setData(varList);  
			mv.setViewName("modules/tbshopcar/tb_shopcar_my"); 
			mv.addObject("page", page);
			
		} catch(Exception e){
			logger.error(e.toString(), e);
		} 
		return mv;
	}
	
	/**
	 * goAdd
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){ 
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("business/tbshopcar/tb_shopcar_add");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * goEdit
	 */
	@RequestMapping(value="/goEdit")
	@ResponseBody
	public PageData goEdit(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = tbShopCarService.findById(pd);	 
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return pd;
	}	
	
	@RequestMapping(value="/goEditView")
	public ModelAndView goEditView(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try { 
		    mv.setViewName("business/tbshopcar/tb_shopcar_edit"); 
			mv.addObject("msg", "edit"); 
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
    @RequestMapping(value="/goDetailView")
	public ModelAndView goDetailView(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try { 
		    mv.setViewName("business/tbshopcar/tb_shopcar_detail"); 
			mv.addObject("msg", "edit"); 
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	@RequestMapping(value="/goAddView")
	public ModelAndView goAddView(){ 
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {  
			mv.setViewName("business/tbshopcar/tb_shopcar_add"); 
			mv.addObject("msg", "edit"); 
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	
	/**
	 * deleteAll
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() { 
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				tbShopCarService.deleteAll(ArrayDATA_IDS);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return null; //AppUtil.returnObject(pd, map);
	} 
}
