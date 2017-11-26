package com.jiuji.cn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jiuji.cn.business.tbuser.dao.TbUserDao;
import com.jiuji.cn.business.tbuser.service.TbUserService;
import com.jiuji.cn.service.HomePageService;

import com.lanbao.base.CommonController;
import com.lanbao.base.PageData;
import com.lanbao.utils.MD5Utils;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.api.qzone.UserInfo;
import com.qq.connect.javabeans.AccessToken;
import com.qq.connect.javabeans.qzone.UserInfoBean;
import com.qq.connect.oauth.Oauth;

import sun.awt.ModalExclude;

@Controller
@RequestMapping("/homePageCtrl")
public class HomePageCtrl extends CommonController {

	@Autowired
	HomePageService homePageService;

	@Autowired
	TbUserDao tbUserDao;
	
	 
	
	@RequestMapping("/page/{modules}/{func}")
	public String toMain1(@PathVariable String modules,@PathVariable String func) {
		System.out.println("modules"+modules+"func:"+func);
		return "/modules/"+modules+"/"+func; 
	    //return "redirect:/"+modules+"/"+func; 	 
	}
	
	@RequestMapping("/page/{modules}/{func}/{page}")
	public String toMain(@PathVariable String modules,@PathVariable String func, @PathVariable String page) {
		System.out.println("modules"+modules+"func:"+func+"page:"+page); 
		return "/"+modules+"/"+func+"/"+page;
	}
	
	@RequestMapping("/modules/{func}/{page}")
	public String toMain2(@PathVariable String modules,@PathVariable String func, @PathVariable String page) {
		System.out.println("modules"+modules+"func:"+func+"page:"+page); 
		return "/modules/"+func+"/"+page;
	}
	
	
	@RequestMapping("/toHomeHeader")
	public String toHomeHeader() {
		return "/modules/homemain/homeheader";
	}
	

	@RequestMapping("/toTop")
	public String top() {
		return "/modules/homemain/top";
	}

	@RequestMapping("/toLeft")
	public String left() {
		return "/modules/homemain/left";
	}

	@RequestMapping("/toRight")
	public String right() {
		return "/modules/homemain/right";
	}

	@RequestMapping("/toBottom")
	public String bottom() {
		return "/modules/homemain/bottom";
	}

	@RequestMapping("/toHeader")
	public String header() {
		return "/commons/header";
	}

	@RequestMapping("/toFooter")
	public String footer() {
		return "/commons/footer";
	}

	@RequestMapping("/toLogin")
	public String toLogin() {
		return "/modules/homepage/login";
	}
	
	/**
	 * ------------------------------help------------------------------
	 * @return
	 */
	
	@RequestMapping("/help/toIndex")
	public String toIndex() {
		return "/modules/help/index";
	}
	
	@RequestMapping("/help/toXsbz")
	public String toXsbz() {
		return "/modules/help/xsbz";
	}
	
	/**
	 * 购物流程
	 * @return
	 */
	@RequestMapping("/help/toGwlc")
	public String toGwlc() {
		return "/modules/help/gwlc";
	}
	
	
	/**
	 * 常见问题
	 * @return
	 */
	@RequestMapping("/help/toCjwt")
	public String toCjwt() {
		return "/modules/help/cjwt";
	}
	
	
	/**
	 * 支付宝支付
	 * @return
	 */
	@RequestMapping("/help/toZfbzf")
	public String toZfbzf() {
		return "/modules/help/zfbzf";
	}
	
	
	/**
	 * 快递送货
	 * @return
	 */
	@RequestMapping("/help/toKdsh")
	public String toKdsh() {
		return "/modules/help/kdsh";
	}
	
	
	/**
	 * 注册协议
	 * @return
	 */
	@RequestMapping("/help/toZcxy")
	public String toZcxy() {
		return "/modules/help/zcxy";
	}
	
	
	/**
	 * 关于我们
	 * @return
	 */
	@RequestMapping("/help/toGywm")
	public String toGywm() {
		return "/modules/help/gywm";
	}
	
	
	
	/**
	 * 平台公告
	 * @return
	 */
	@RequestMapping("/notice/toIndex")
	public String toNoticeIndex() {
		return "/modules/notice/index";
	}
	
	@RequestMapping("/notice/toPtgg")
	public String toPtgg() {
		return "/modules/notice/ptgg";
	}
	
	@RequestMapping("/notice/toHygg")
	public String toHygg() {
		return "/modules/notice/hygg";
	}
	
	
	
	
	@RequestMapping("/toWapLogin")
	public String toWapLogin() {
		return "/wapjiuji/login/login";
	}
	

	@RequestMapping("/toRegister")
	public String register() {
		return "/modules/homepage/newRegister";
	}
	
	
	
	@RequestMapping("/toBingUser")
	public String toBingUser(HttpServletRequest request,Model model,HttpSession session) {
		try {
			AccessToken accessTokenObj = (new Oauth()).getAccessTokenByRequest(request);
		   if(!accessTokenObj.getAccessToken().equals("")){
			   String accessToken = accessTokenObj.getAccessToken();
			   OpenID openIDObj = new OpenID(accessToken);
			   String openID = openIDObj.getUserOpenID();
			   UserInfo qzoneUserInfo = new UserInfo(accessToken, openID);
			   UserInfoBean userInfoBean = qzoneUserInfo.getUserInfo();
			   String nickname = userInfoBean.getNickname();
			   model.addAttribute("openID",openID);
			   model.addAttribute("F_NickName",nickname);
			   PageData queryPd = new PageData();
			   queryPd.put("F_OPEN_ID", openID);
			   List<PageData> pds = (List<PageData>) tbUserDao.mb_findForList("TbUserMapper.select", queryPd);
			   //如果绑定过,直接跳到主页
			   if(pds.size()==1){
				   PageData user_result = pds.get(0);
				   Subject user = SecurityUtils.getSubject();  
				   String username = user_result.getString("F_UserName");
				   String newPass =  user_result.getString("F_Password");
				    UsernamePasswordToken  token = new UsernamePasswordToken(username,newPass); 
				     user.login(token); 
				     session.setAttribute("F_USER_ID", user_result.getString("F_USER_ID"));  
			         session.setAttribute("USERNAME", user_result.getString("F_UserName")); 
			         
				    if (user.isAuthenticated()) {   
			             return  "redirect:/homePageCtrl/toHomePage.do"; //"/modules/homepage/homepage";  
			        }  
				    
			   }
		   }
		} catch (QQConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/modules/homepage/bingUser";
	}
	
	
	@RequestMapping("/toWapRegister")
	public String toWapRegister() {
		return "/wapjiuji/login/reg";
	}

	/**
	 * 主页 获取分类信息，
	 * 
	 * @return
	 */
	@RequestMapping("/toHomePage")
	public String toHomePage(Model model, HttpSession session,HttpServletRequest req) {
		homePageService.queryInfomation(model, session,req);
		model.addAttribute("STATIC_PAG", true);  
		return "/modules/homepage/homepage";
	}
	
	/**
	 * 却wapjiuji 首页
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toWapHomePage")
	public String wapHomePage(Model model, HttpSession session,HttpServletRequest req) {
		homePageService.queryInfomation(model, session,req);
		return "/wapjiuji/index";
	}
	
	/**
	 * 却wapjiuji 首页
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toWapSort")
	public String wapSort(Model model, HttpSession session) {
		homePageService.queryClassInfomation(model, session);
		return "/wapjiuji/sort";
	}

	@RequestMapping("/toRecordContact")
	public String toRecordContact(Model model, HttpSession session, HttpServletRequest request) {
		model.addAttribute("productName", request.getParameter("productName"));
		model.addAttribute("productId", request.getParameter("productId"));
		return "/modules/product/recordContact";
	}

	@RequestMapping(value="/toInformation",method=RequestMethod.GET)
	public String toInformation(Model model, HttpSession session, HttpServletRequest request) { 
	    model.addAttribute("para", request.getParameter("para"));
		return "/modules/person/information";
	}
	
	@RequestMapping("/toWapInformation")
	public String toWapInformation(Model model, HttpSession session, HttpServletRequest request) {
		return "/wapjiuji/my_center/my_center";
	}
	
	@RequestMapping("/toWapMyMessage")
	public String toWapMyMessage(Model model, HttpSession session, HttpServletRequest request) {
		return "/wapjiuji/my_center/my_message";
	}
	
	

	@RequestMapping("/toPersonal")
	public String toPersonal(Model model, HttpSession session, HttpServletRequest request) {
		return "/modules/person/personal";
	}

	@RequestMapping("/toDeliveryAddress")
	public String toDeliveryAddress(Model model, HttpSession session, HttpServletRequest request) {
		return "/modules/tbaddress/tb_address_index";
	}
	
	@RequestMapping("/toWapDeliveryAddress")
	public String toWapDeliveryAddress(Model model, HttpSession session, HttpServletRequest request) {
		return "/wapjiuji/address/address_management";
	}
	

	@RequestMapping("/toMyCollection")
	public String toMyCollection(Model model, HttpSession session, HttpServletRequest request) {
		return "/modules/person/myShouchang";
	}

	@RequestMapping("/toTest")
	public String toTest(Model model, HttpSession session, HttpServletRequest request) {
		return "/modules/test/test";
	}

}
