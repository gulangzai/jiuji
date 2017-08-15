package com.jiuji.cn.business.pay;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TPicture;
import com.jiuji.cn.model.TProduct;
import com.jiuji.cn.model.TProductDto;
import com.jiuji.cn.result.ProjectPictureResult;
import com.jiuji.cn.service.PictureService;
import com.jiuji.cn.service.ProductService;

import com.lanbao.base.Suggestion;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiuji.cn.business.tbaddress.service.TbAddressService;
import com.jiuji.cn.business.tborder.service.TbOrderService;
import com.jiuji.cn.business.tborder.vo.TbOrder;
import com.jiuji.cn.business.tbproduct.service.TbProductService;
import com.jiuji.cn.business.tbstandard.model.TbStandard;
import com.jiuji.cn.business.tbstandard.service.TbStandardService;
import com.jiuji.cn.business.tbyouhui.model.TbYouhui;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.jiuji.cn.business.tbyouhui.service.TbYouhuiService;
import com.jiuji.cn.business.tbyouhuiuser.service.TbYouhuiUserService;
  

@Controller
@RequestMapping("/payCtrl")
public class PayCtrl { 
	
	@Autowired
	TbAddressService tbAddressService;
	
	@Autowired
	TbProductService tbProductService;
	
	@Autowired
	TbOrderService tbOrderService;
	
	@Autowired
	TbYouhuiService tbYouhuiService;
	
	@Autowired
	TbYouhuiUserService tbYouhuiUserService;
	
	@RequestMapping("/toIndex") 
	public ModelAndView toIndex(HttpSession session,String F_SKU,String productAttr,String productName,String productId,String F_PRICE,String productPrice,String productDesc,String F_BuyCount,String F_Cost,String F_Express) throws Exception{  
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/modules/product/buynow_my");
	    
	    Page page =  new Page(); 
 		PageData pd = new PageData();
 		pd.put("F_USER_ID", session.getAttribute("F_USER_ID"));
 		List<PageData>	varList  = null; 
 		page.setPd(pd);  
 		try {
 			varList = tbAddressService.myDataList(page);
 		} catch (Exception e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}	 
 		page.setData(varList);  
	 		
 		PageData product = tbProductService.queryById(productId);
 		JSONObject productObj = new JSONObject(product);
 		mav.addObject("product", productObj);
	    mav.addObject("F_ProductName",productName);
	    mav.addObject("F_SKU",product.get("F_SKU"));
	    mav.addObject("F_PRODUCT_ID",productId);
	    mav.addObject("F_SinglePrice",product.get("F_PRICE"));
	    mav.addObject("F_PRICE",product.get("F_PRICE"));
	    mav.addObject("F_Cost",F_Cost);
	    mav.addObject("F_BuyCount",F_BuyCount);
	    mav.addObject("productDesc",productDesc);  
	    mav.addObject("F_Express",F_Express);
	    mav.addObject("productAttr",productAttr);
		mav.addObject("page",page);
	    
		return mav;
	} 
	
	/**
	 * 下单
	 * @param WIDout_trade_no
	 * @param WIDsubject
	 * @param WIDtotal_fee
	 * @param WIDbody
	 * @return
	 */
	@RequestMapping("/toAlipayapi") 
	public ModelAndView toAlipayapi(HttpServletRequest request,HttpSession session,String WIDout_trade_no,String WIDsubject,String WIDtotal_fee,String WIDbody){  
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/modules/pay/alipayapi");
	    mav.addObject("WIDout_trade_no",WIDout_trade_no);
	    mav.addObject("WIDsubject",WIDsubject);
	    mav.addObject("WIDtotal_fee",WIDtotal_fee);
	    mav.addObject("WIDbody",WIDbody);
	    
		
	    /*TbOrder tbOrder = new TbOrder(); 
	    tbOrder.setF_orderseries(WIDout_trade_no); 
	    tbOrder.setF_sku(request.getParameter("F_SKU"));
	    tbOrder.setF_product_id(request.getParameter("F_PRODUCT_ID"));
	    tbOrder.setF_user_id((String)session.getAttribute("F_USER_ID"));
	    tbOrder.setF_product_attr(request.getParameter("F_ProductAttr"));
	    tbOrder.setF_buycount(Integer.parseInt(request.getParameter("F_BuyCount")));
	    tbOrder.setF_message(request.getParameter("F_Message"));
		tbOrder.setF_address_uid(Integer.parseInt(request.getParameter("F_ADDRESS_UID")));
	    tbOrder.setCreate_date(new Date());
		tbOrder.setF_status(-1);*/
		
		PageData tbOrderPd = new PageData();
		
		try {
			Double f_cost =  Double.valueOf(request.getParameter("F_Cost"));
			String F_YOUHUI_USER_UID = request.getParameter("F_YOUHUI_USER_UID");
			if(F_YOUHUI_USER_UID!=null&&!"".equals(F_YOUHUI_USER_UID)){ 
				TbYouhuiUser tyu = new TbYouhuiUser();
				tyu.setfYouhuiUserUid(F_YOUHUI_USER_UID);
				TbYouhui ty = tbYouhuiService.queryMoneyById(tyu);
				Integer youhui_money = ty.getFMoney();
				if(youhui_money!=null){
					f_cost = f_cost - youhui_money;
					WIDtotal_fee = String.valueOf(f_cost);
				}
				
				//更新优惠券
				tyu.setfIsUsed(0);
				tbYouhuiUserService.update(tyu);
			}
			
		    
		    
			tbOrderPd.put("F_OrderSeries",WIDout_trade_no); 
			tbOrderPd.put("F_SKU", request.getParameter("F_SKU"));
			tbOrderPd.put("F_PRODUCT_ID",request.getParameter("F_PRODUCT_ID"));
			tbOrderPd.put("F_USER_ID",(String)session.getAttribute("F_USER_ID"));
			tbOrderPd.put("F_SinglePrice", Double.valueOf(request.getParameter("F_SinglePrice")));
			tbOrderPd.put("F_BuyCount",Double.valueOf(request.getParameter("F_BuyCount")));
			tbOrderPd.put("F_Cost",WIDtotal_fee);
			tbOrderPd.put("F_Message",request.getParameter("F_Message"));
			tbOrderPd.put("F_ADDRESS_UID",Integer.parseInt(request.getParameter("F_ADDRESS_UID")));
			tbOrderPd.put("CREATE_DATE",new Date());
			tbOrderPd.put("F_Status",-1);
			tbOrderService.save(tbOrderPd);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
		}
	    return mav;
	} 
	
	/**
	 * 购物车下单
	 * @param WIDout_trade_no
	 * @param WIDsubject
	 * @param WIDtotal_fee
	 * @param WIDbody
	 * @return
	 */
	@RequestMapping("/toShopCarAlipayapi") 
	public ModelAndView toShopCarAlipayapi(HttpServletRequest request,HttpSession session,String WIDout_trade_no,String WIDsubject,String WIDtotal_fee,String WIDbody){  
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/modules/pay/alipayapi");
	    mav.addObject("WIDout_trade_no",WIDout_trade_no);
	    mav.addObject("WIDsubject",WIDsubject);
	    mav.addObject("WIDtotal_fee",WIDtotal_fee);
	    mav.addObject("WIDbody",WIDbody);
	    
		
	    String F_Costs = request.getParameter("F_Costs");
	    String F_BuyCounts = request.getParameter("F_BuyCounts");
	    String F_PRODUCT_IDs = request.getParameter("F_PRODUCT_IDs");
	    String F_SinglePrices = request.getParameter("F_SinglePrices");
	    //多件不一样的商品
	     
	    String[] products = F_PRODUCT_IDs.split(",");
	    String[] F_Costs_ay = F_Costs.split(",");
	    String[] F_BuyCounts_ay=F_BuyCounts.split(",");
	    String[] F_SinglePrice_ay = F_SinglePrices.split(",");
	    for (int i = 0; i < products.length; i++) {
	    	WIDout_trade_no = getUUID();  
	    	PageData tbOrderPd = new PageData(); 
			try {
				tbOrderPd.put("F_OrderSeries",WIDout_trade_no); 
				tbOrderPd.put("F_PRODUCT_ID",products[i]);
				tbOrderPd.put("F_USER_ID",(String)session.getAttribute("F_USER_ID"));
				tbOrderPd.put("F_SinglePrice", Double.valueOf(F_SinglePrice_ay[i]));
				tbOrderPd.put("F_BuyCount",Double.valueOf(F_BuyCounts_ay[i]));
				tbOrderPd.put("F_Cost",Double.valueOf(F_Costs_ay[i]));
				tbOrderPd.put("F_Message",request.getParameter("F_Message"));
				tbOrderPd.put("F_ADDRESS_UID",Integer.parseInt(request.getParameter("F_ADDRESS_UID")));
				tbOrderPd.put("CREATE_DATE",new Date());
				tbOrderPd.put("F_Status",-1);
				tbOrderService.save(tbOrderPd);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	    return mav;
	}
	    
	    /**
		 * 购物车下单
		 * @param WIDout_trade_no
		 * @param WIDsubject
		 * @param WIDtotal_fee
		 * @param WIDbody
		 * @return
		 */
    @RequestMapping("/toNotify_url") 
    public ModelAndView toNotify_url(HttpServletRequest request,HttpSession session,String WIDout_trade_no,String WIDsubject,String WIDtotal_fee,String WIDbody){  
		ModelAndView mav = new ModelAndView();
	    mav.setViewName("/modules/pay/notify_url");  
	    return mav;
	} 
	
    @RequestMapping("/toReturn_url") 
    public ModelAndView toReturn_url(HttpServletRequest request,HttpSession session,String WIDout_trade_no,String WIDsubject,String WIDtotal_fee,String WIDbody){  
	    ModelAndView mav = new ModelAndView();
		mav.setViewName("/modules/pay/return_url");  
	    return mav;
	} 
    

    public static String getUUID() {  
        UUID uuid = UUID.randomUUID();  
        String str = uuid.toString();  
       // 去掉"-"符号 
       String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);  
       SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMddHHmmss"); 
       temp = formatter.format(new Date());  
       return temp;  
    } 
    
    
    

	
}
