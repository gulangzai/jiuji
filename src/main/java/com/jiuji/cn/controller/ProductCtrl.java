package com.jiuji.cn.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TPicture;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.result.ProjectPictureResult;
import com.jiuji.cn.service.PictureService;
import com.jiuji.cn.service.ProductService;

import com.lanbao.base.Suggestion; 
import com.lanbao.base.PageData;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.business.tbstandard.service.TbStandardService;
 

@Controller
@RequestMapping("/productCtrl")
public class ProductCtrl {
	
	@Autowired
	ProductService productService;
	@Autowired
	PictureService pictureService;
	
	@Autowired
	TbStandardService tbStandardService;
	
	
	@RequestMapping("/toSingleProduct") 
	public String toSingleProduct(String f_ProductId,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		TProduct tproduct = productService.queryById(f_ProductId);
		PageData pd = new PageData();
		pd.put("F_PRODUCT_ID", tproduct.getFProductId());
		List<PageData> tPictures;
		try {
			tPictures = pictureService.queryByProduct(pd);
			//List<TbStandard> tbStandards = tbStandardService.queryByProductId(new TbStandard(Integer.parseInt(tproduct.getFProductId())));
			model.addAttribute("singleProduct", tproduct);
			//model.addAttribute("tbStandards",tbStandards);
			model.addAttribute("t_pictures",tPictures);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	
		return "/modules/product/singleProduct";
	}
	
	/**
	 * @param f_clsId
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("/toProjectListPage") 
	public String toProjectListPage(String f_clsId,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		List<PageData> tproducts;
		try {
			tproducts = productService.queryByClsId(f_clsId);
			List<ProjectPictureResult> projectPictureResults = new ArrayList<ProjectPictureResult>();
			for(PageData tproduct:tproducts){
				List<PageData> tbPictures = pictureService.queryByProduct(tproduct);  
				ProjectPictureResult projectPictureResult = new ProjectPictureResult(tproduct,tbPictures);
				projectPictureResults.add(projectPictureResult);
			} 
			model.addAttribute("projectPictureResults", projectPictureResults); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "/modules/product/projectList";
	}
	
	/**
	 * @param f_clsId
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 */
	@RequestMapping("/toWapProjectListPage") 
	public String toWapProjectListPage(String f_clsId,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		List<PageData> tproducts;
		try {
			tproducts = productService.queryByClsId(f_clsId);
			List<ProjectPictureResult> projectPictureResults = new ArrayList<ProjectPictureResult>();
			for(PageData tproduct:tproducts){
				List<PageData> tbPictures = pictureService.queryByProduct(tproduct);  
				ProjectPictureResult projectPictureResult = new ProjectPictureResult(tproduct,tbPictures);
				projectPictureResults.add(projectPictureResult);
			} 
			model.addAttribute("projectPictureResults", projectPictureResults); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return "/wapjiuji/product/product_list";
	}
	
	
 
	@RequestMapping("/searchProduct")
	@ResponseBody
    public JSONArray searchProduct(HttpServletRequest request){ 
		String term = request.getParameter("term"); 
		JSONArray array = new JSONArray();
		try {
			  array = productService.searchProduct(term);
		} catch (Exception e) {
			// TODO: handle exception
		} 
		return array;
	}
}
