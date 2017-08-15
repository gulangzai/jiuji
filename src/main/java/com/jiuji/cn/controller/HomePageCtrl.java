package com.jiuji.cn.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jiuji.cn.service.HomePageService;

import com.lanbao.base.CommonController;

@Controller
@RequestMapping("/homePageCtrl")
public class HomePageCtrl extends CommonController {

	@Autowired
	HomePageService homePageService;

	 
	
	@RequestMapping("/page/{modules}/{func}")
	public String toMain1(@PathVariable String modules,@PathVariable String func) {
		System.out.println("modules"+modules+"func:"+func);
		return "/"+modules+"/"+func; 
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
	
	
	
	
	
	
	@RequestMapping("/toWapLogin")
	public String toWapLogin() {
		return "/wapjiuji/login/login";
	}
	

	@RequestMapping("/toRegister")
	public String register() {
		return "/modules/homepage/newRegister";
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
	public String toHomePage(Model model, HttpSession session) {
		homePageService.queryInfomation(model, session);
		return "/modules/homepage/homepage";
	}
	
	/**
	 * 却wapjiuji 首页
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toWapHomePage")
	public String wapHomePage(Model model, HttpSession session) {
		homePageService.queryInfomation(model, session);
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

	@RequestMapping("/toInformation")
	public String toInformation(Model model, HttpSession session, HttpServletRequest request) {
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
