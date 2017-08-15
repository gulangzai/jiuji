package com.jiuji.cn.business.tbproduct.controller;

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
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction;
import com.lanbao.controller.BaseController;
import com.lanbao.utils.AppUtil;
import com.lanbao.utils.Const;
import com.lanbao.utils.ObjectExcelView;

import com.jiuji.cn.business.pictures.service.TbPicturesService;
import com.jiuji.cn.business.sysattr.service.SysAttrService;
import com.jiuji.cn.business.sysattr.vo.SysAttr;
import com.jiuji.cn.business.tbcolor.service.TbColorService;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.business.tbstandard.service.TbStandardService;
import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.business.tbproduct.service.TbProductService;
import com.jiuji.cn.business.tbproductattr.service.TbProductAttrService;
import com.jiuji.cn.business.tbproductattr.vo.TbProductAttr;
import com.jiuji.cn.business.tbsize.service.TbSizeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/** 
 * 绫诲悕绉帮細TProductController
 * 鍒涘缓浜猴細FH 
 * 鍒涘缓鏃堕棿锛�2016-06-05
 */
@Controller
@RequestMapping(value="/tbProductController")
public class TbProductController extends BaseController {
	
	String menuUrl = "tbProductController/list.do"; //鑿滃崟鍦板潃(鏉冮檺鐢�)
	
	@Resource(name="tbProductService")
	private TbProductService tbProductService;
	
	@Resource(name="tbStandardService")
	private TbStandardService tbStandardService;
	
	@Resource(name="tbPicturesService")
	private TbPicturesService tbPicturesService;
	
	@Resource(name="tbProductAttrService")
	private TbProductAttrService tbProductAttrService;
	
	@Resource(name="sysAttrService")
	private SysAttrService sysAttrService;
	
	@Resource(name="tbColorService")
	private TbColorService tbColorService;
	
	@Resource(name="tbSizeService")
	private TbSizeService tbSizeService;
	 
	/**
	 * 鏂板
	 */
	@RequestMapping(value="/save")
	@ResponseBody
	public ResultAction save() throws Exception{
		logBefore(logger, "鏂板TProductController");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //鏍￠獙鏉冮檺
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//pd.put("TPRODUCTCONTROLLER_ID", this.get32UUID());	//涓婚敭
		String f_StandardName = pd.getString("F_StandardName");
		int productId = tbProductService.save(pd);
		
		HttpServletRequest request = this.getRequest();
		Map properties = request.getParameterMap();
		String[] F_StandardNames = (String[]) properties.get("F_StandardName[]"); 
		String[] F_StandardValues = (String[]) properties.get("F_StandardValue[]"); 
		String[] F_XUHAOs = (String[]) properties.get("F_XUHAO[]"); 
		if(F_StandardNames!=null){
			for(int i=0;i<F_StandardNames.length;i++){
				PageData pds = new PageData();
				pds.put("F_StandardName", F_StandardNames[i]);
				pds.put("F_StandardValue", F_StandardValues[i]);
				pds.put("F_XUHAO", F_XUHAOs[i]);
				pds.put("F_PRODUCT_ID", pd.get("id"));
				//standardService.save(pds);
			} 
		}
		
		String[] PICTURES_IDs = request.getParameterValues("PICTURES_ID");
		if(!"".equals(PICTURES_IDs)){
			for(int i=0;i<PICTURES_IDs.length;i++){
				//存图片
				pd.put("PICTURES_ID", PICTURES_IDs[i]);
				PageData picture = tbPicturesService.findById(pd); 
				picture.put("TABLE_NAME", "TB_PRODUCT");			 
				picture.put("TABLE_UID_VALUE",productId);						  
				tbPicturesService.update(picture);
			} 
		}
	
		
		com.lanbao.base.ResultAction ra = new com.lanbao.base.ResultAction();
		ra.setIserror(false);
		return ra;
	}
	
	/**
	 * 鍒犻櫎
	 */
	@RequestMapping(value="/delete")
	@ResponseBody
	public ResultAction delete(){
		logBefore(logger, "鍒犻櫎TProductController");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //鏍￠獙鏉冮檺
		ResultAction ra = new ResultAction(); 
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			tbProductService.delete(pd); 
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		ra.setIserror(false);
		return ra;
	}
	
	/**
	 * 淇敼
	 */
	@RequestMapping(value="/edit")
	@ResponseBody
	public ResultAction edit(HttpServletRequest request) throws Exception{
		logBefore(logger, "淇敼TProductController");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //鏍￠獙鏉冮檺
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String PICTURES_ID = pd.getString("PICTURES_ID");
		String F_PRODUCT_ID = pd.getString("F_PRODUCT_ID");
		//String[] PICTURES_IDs = pd.getString("PICTURES_ID");
		String[] PICTURES_IDs = request.getParameterValues("PICTURES_ID");
		//PICTURES_IDs= PICTURES_ID.split(","); 
		if(!"".equals(PICTURES_IDs)){
			for(int i=0;i<PICTURES_IDs.length;i++){
				//存图片
				pd.put("PICTURES_ID", PICTURES_IDs[i]);
				PageData picture = tbPicturesService.findById(pd); 
				picture.put("TABLE_NAME", "TB_PRODUCT");			 
				picture.put("TABLE_UID_VALUE",F_PRODUCT_ID);						  
				tbPicturesService.update(picture);
			} 
		}
		
		tbProductService.edit(pd); 
		com.lanbao.base.ResultAction ra = new com.lanbao.base.ResultAction();
		ra.setIserror(false);
		return ra;
	}
	
	/**
	 * 鍒楄〃
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page){
		logBefore(logger, "鍒楄〃TProductController");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //鏍￠獙鏉冮檺
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			//page.setPd(pd);
			List<PageData>	varList = tbProductService.list(page);	//鍒楀嚭TProductController鍒楄〃
			mv.setViewName("business/tbproduct/tbproduct_list");
			mv.addObject("varList", varList);
			mv.addObject("pd", pd);
			mv.addObject(Const.SESSION_QX,this.getHC());	//鎸夐挳鏉冮檺
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	
	
	/**
	 * 鍒楄〃
	 */
	@RequestMapping(value="/dataList")
	@ResponseBody
	public Page dataList(){
		logBefore(logger, "鍒楄〃TProductController");  
		Page page =  new Page(); 
		PageData pd = this.getPageData();
		List<PageData>	varList  = null;
		try{ 
			page.setPd(pd);  
			varList = tbProductService.list(page);	//鍒楀嚭TProductController鍒楄〃 
			page.setData(varList);  
		} catch(Exception e){
			logger.error(e.toString(), e);
		} 
		return page;
	}
	
	/**
	 * 鍘绘柊澧為〉闈�
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		logBefore(logger, "鍘绘柊澧濼ProductController椤甸潰");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("business/tbproduct/tbproduct_add");
			mv.addObject("msg", "save");
			mv.addObject("pd", pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	/**
	 * 鍘讳慨鏀归〉闈�
	 */
	@RequestMapping(value="/goEdit")
	@ResponseBody
	public PageData goEdit(){
		logBefore(logger, "鍘讳慨鏀筎ProductController椤甸潰");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd = tbProductService.findById(pd);	//鏍规嵁ID璇诲彇 
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return pd;
	}	
	
	@RequestMapping(value="/goEditView")
	public ModelAndView goEditView(){
		logBefore(logger, "鍘讳慨鏀筎ProductController椤甸潰");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try { 
			mv.setViewName("business/tbproduct/tbproduct_edit_view");
			mv.addObject("msg", "edit"); 
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}	
	
	@RequestMapping(value="/goAddView")
	public ModelAndView goAddView(){
		logBefore(logger, "鍘讳慨鏀筎ProductController椤甸潰");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try { 
			mv.setViewName("business/tbproduct/tbproduct_add_view");
			mv.addObject("msg", "edit"); 
			mv.addObject("pd",pd);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
	
	
	
	/**
	 * 鎵归噺鍒犻櫎
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		logBefore(logger, "鎵归噺鍒犻櫎TProductController"); 
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String DATA_IDS = pd.getString("DATA_IDS");
			if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				tbProductService.deleteAll(ArrayDATA_IDS);
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
		return AppUtil.returnObject(pd, map);
	}
	
	/*
	 * 瀵煎嚭鍒癳xcel
	 * @return
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel(){
		logBefore(logger, "瀵煎嚭TProductController鍒癳xcel"); 
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			Map<String,Object> dataMap = new HashMap<String,Object>();
			List<String> titles = new ArrayList<String>();
			titles.add("鍟嗗搧鍚�");	//1
			titles.add("鍟嗗搧鎻忚堪");	//2
			titles.add("鍟嗗搧浠锋牸");	//3
			titles.add("鍟嗗搧绫诲瀷");	//4
			titles.add("鏄惁鐗瑰崠");	//5
			dataMap.put("titles", titles);
			List<PageData> varOList = tbProductService.listAll(pd);
			List<PageData> varList = new ArrayList<PageData>();
			for(int i=0;i<varOList.size();i++){
				PageData vpd = new PageData();
				vpd.put("var1", varOList.get(i).getString("F_ProductName"));	//1
				vpd.put("var2", varOList.get(i).getString("F_ProductDesc"));	//2
				vpd.put("var3", varOList.get(i).get("F_Price").toString());	//3
				vpd.put("var4", String.valueOf(varOList.get(i).get("F_ClsId")));	//4
				vpd.put("var5", varOList.get(i).get("F_IsSpecial").toString());	//5
				varList.add(vpd);
			}
			dataMap.put("varList", varList);
			ObjectExcelView erv = new ObjectExcelView();
			mv = new ModelAndView(erv,dataMap);
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/* ===============================鏉冮檺================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro绠＄悊鐨剆ession
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================鏉冮檺================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	
	/*------------------------mobile-------------------*/
	@RequestMapping(value="/mobileListByClassId")
	@ResponseBody
	public JSONPObject  mobileListByClassId(Page page,Model model,HttpServletRequest req,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
	    String callbackFunName =req.getParameter("callbackparam");//寰楀埌js鍑芥暟鍚嶇О  
	    
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		page.setPd(pd);
		List<PageData> varList = null;  
		try {  
			varList = tbProductService.findByClassId(page); 
			JSONArray classes = JSONArray.fromObject(varList); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//鍒楀嚭Pictures鍒楄〃
		 return new JSONPObject(callbackFunName, varList);    
	} 
	
	@RequestMapping(value="/mobileProductById")
	@ResponseBody
	public JSONPObject  mobileProductById(Page page,Model model,HttpServletRequest req,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
	    String callbackFunName =req.getParameter("callbackparam");//寰楀埌js鍑芥暟鍚嶇О  
	    
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		page.setPd(pd);
		PageData tbProduct = null;  
		try {  
			tbProduct = tbProductService.findById(pd);  
			JSONArray classes = JSONArray.fromObject(tbProduct); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//鍒楀嚭Pictures鍒楄〃
		 return new JSONPObject(callbackFunName, tbProduct);    
	} 
	
	/**
	 * 新品
	 * @param page
	 * @param model
	 * @param req
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/appletProductNew",method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<PageData>  appletProductNew(Page page,Model model,HttpServletRequest req,HttpServletResponse response){ 	
	    
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		page.setPd(pd);
		PageData tbProduct = null;  
		List<PageData> varList = null; 
		try {  
			//tbProduct = tbProductService.findById(pd);  
			varList = tbProductService.findNewGood(); 
			//鑾峰彇鐑棬鍙戝竷鐨�5涓晢鍝�
			//List<TProductDto> tproductHots = tproductMapper.findNewHot(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//鍒楀嚭Pictures鍒楄〃
		 return varList;    
	}
	
	/**
	 * 特卖
	 * @param page
	 * @param model
	 * @param req
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/appletProductSpecial",method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<PageData>  appletProductSpecial(Page page,Model model,HttpServletRequest req,HttpServletResponse response){ 
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		page.setPd(pd);
		PageData tbProduct = null;  
		List<PageData> varList = null; 
		try {  
			//tbProduct = tbProductService.findById(pd);  
			varList = tbProductService.findNewSpecial(); 
			//鑾峰彇鐑棬鍙戝竷鐨�5涓晢鍝�
			//List<TProductDto> tproductHots = tproductMapper.findNewHot(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//鍒楀嚭Pictures鍒楄〃
		 return varList;   
	}
	
	
	
	@RequestMapping(value="/mobileProductHot")
	@ResponseBody
	public JSONPObject  mobileProductHot(Page page,Model model,HttpServletRequest req,HttpServletResponse response){
		response.setHeader("Access-Control-Allow-Origin", "*");
	    String callbackFunName =req.getParameter("callbackparam");//寰楀埌js鍑芥暟鍚嶇О  
	    
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 
		page.setPd(pd);
		PageData tbProduct = null;  
		List<PageData> varList = null; 
		try {  
			//tbProduct = tbProductService.findById(pd);  
			varList = tbProductService.findNewHot(); 
			//鑾峰彇鐑棬鍙戝竷鐨�5涓晢鍝�
			//List<TProductDto> tproductHots = tproductMapper.findNewHot(); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	//鍒楀嚭Pictures鍒楄〃
		 return new JSONPObject(callbackFunName, varList);    
	} 
	
	
	

	@RequestMapping("/toSingleProduct") 
	public String toSingleProduct(String f_ProductId,String f_parentSku,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		PageData tproduct = new PageData();
		try {
			
			PageData tbproduct = new PageData();
			tbproduct.put("F_PARENT_SKU", f_parentSku);
			List<PageData> productList = tbProductService.queryByParentSku(tbproduct); 
			
			List<PageData> tbColors = tbProductService.findByColor(tbproduct);
			if(tbColors.size()>0){
				if(null!=tbColors.get(0).get("F_COLOR")&&!"".equals(tbColors.get(0).get("F_COLOR"))){
					model.addAttribute("tbColors", tbColors);
				}
			}
			
			List<PageData> tbSizes = tbProductService.findBySize(tbproduct);
			if(tbSizes.size()>0){
				if(null!=tbSizes.get(0).get("F_SIZE")&&!"".equals(tbSizes.get(0).get("F_SIZE"))){
					model.addAttribute("tbSizes", tbSizes);
				}
			}
			
			
			List<PageData> tPictures = new ArrayList();
			List<PageData> tbStandards = new ArrayList();
			if(productList.size()>0){
				 tproduct = productList.get(0);
				 tPictures = tbProductService.queryByProduct(tproduct);  
				 tbStandards = tbStandardService.queryByProductId(tproduct);
			}
			
			String F_PRODUCTDESC = (String) tproduct.get("F_PRODUCTDESC");
			if(F_PRODUCTDESC!=null){
				F_PRODUCTDESC  = F_PRODUCTDESC.replaceAll("\\n", "<br>");
				tproduct.put("F_PRODUCTDESC", F_PRODUCTDESC);
			}
			
			
			//产品属性关联表 
		 /*	List<TbProductAttr> tbProductAttrs = tbProductAttrService.findBy(tproduct);
			
			for (TbProductAttr tbProductAttr : tbProductAttrs) {
				PageData querySysAttrPara = new PageData();
				querySysAttrPara.put("F_ATTR_UID", tbProductAttr.getF_attr_uid());
				PageData sysAttrs = sysAttrService.findById(querySysAttrPara); 
				if("tb_color".equals(sysAttrs.getString("F_ATTR_TABLE"))){ 
					List<PageData> tbColors = tbColorService.findBy(tproduct);
					model.addAttribute("tbColors", tbColors);
				}else if("tb_size".equals(sysAttrs.getString("F_ATTR_TABLE"))){
					List<PageData> tbSizes = tbSizeService.findBy(tproduct);
					model.addAttribute("tbSizes", tbSizes);
				}
			}
			*/
			
			
			
		
			
			model.addAttribute("productList",JSONArray.fromObject(productList));
			model.addAttribute("singleProduct", tproduct);
			model.addAttribute("tbStandards",tbStandards);
			model.addAttribute("t_pictures",tPictures);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "/modules/product/singleProduct";
	}
	
	@RequestMapping("/toWapSingleProduct") 
	public String toWapSingleProduct(String f_ProductId,String f_parentSku,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		PageData tproduct =  new PageData();
		try { 
			PageData tbproduct = new PageData();
			tbproduct.put("F_PARENT_SKU", f_parentSku);
			List<PageData> productList = tbProductService.queryByParentSku(tbproduct); 
			
			List<PageData> tbColors = tbProductService.findByColor(tbproduct);
			if(tbColors.size()>0){
				if(null!=tbColors.get(0).get("F_COLOR")&&!"".equals(tbColors.get(0).get("F_COLOR"))){
					model.addAttribute("tbColors", tbColors);
				}
			}
			
			List<PageData> tbSizes = tbProductService.findBySize(tbproduct);
			if(tbSizes.size()>0){
				if(null!=tbSizes.get(0).get("F_SIZE")&&!"".equals(tbSizes.get(0).get("F_SIZE"))){
					model.addAttribute("tbSizes", tbSizes);
				}
			}
			
			
			List<PageData> tPictures = new ArrayList();
			List<PageData> tbStandards = new ArrayList();
			if(productList.size()>0){
				 tproduct = productList.get(0);
				 tPictures = tbProductService.queryByProduct(tproduct);  
				 tbStandards = tbStandardService.queryByProductId(tproduct);
			}
			
			 
			//获取热门发布的5个商品
			List<PageData> tproductHots = tbProductService.findNewHot();
			
			model.addAttribute("singleProduct", tproduct);
			model.addAttribute("tbStandards",tbStandards);
			model.addAttribute("t_pictures",tPictures); 
			model.addAttribute("tproductHots",tproductHots);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "/wapjiuji/product/product_details";
	}
	
}
