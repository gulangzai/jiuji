package com.jiuji.cn.business.tbyouhui.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jiuji.cn.business.tbuser.service.TbUserService;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.jiuji.cn.business.tbyouhui.service.TbYouhuiService;
import com.lanbao.base.ResultAction;
import com.lanbao.base.Suggestion;
import com.lanbao.controller.BaseController;
import com.lanbao.utils.MD5Utils;
import com.lanbao.utils.StringUtil; 
import com.lanbao.base.PageData;


@Controller
@RequestMapping("/tbYouhuiCtrl")
public class TbYouhuiCtrl extends BaseController {
	
	@Autowired
	TbYouhuiService tbYouhuiService; 
	
	@RequestMapping("/save")
	@ResponseBody
    public ResultAction save(HttpServletRequest request,TbYouhuiUser tbYouhuiUser,HttpSession session){
    	ResultAction rs = new ResultAction();
    	tbYouhuiUser.setfUserUid((String)session.getAttribute("F_USER_ID"));
    	tbYouhuiUser.setfYouhuiCode(StringUtil.getStringRandom(8).toUpperCase());
    	tbYouhuiService.save(tbYouhuiUser);
    	return rs;
    }
	

	@RequestMapping("/alreadyHad")
	@ResponseBody
    public ResultAction alreadyHad(HttpServletRequest request,TbYouhuiUser tbYouhuiUser,HttpSession session){
    	ResultAction rs = new ResultAction();
    	tbYouhuiUser.setfUserUid((String)session.getAttribute("F_USER_ID")); 
    	List<TbYouhuiUser> tbYouhuiUsers = tbYouhuiService.alreadyHad(tbYouhuiUser);
    	if(tbYouhuiUsers.size()==0){
    		rs.setIserror(false);
    	}else{
    		rs.setIserror(true);
    	}
    	return rs;
    }
	
	

	/**
	 * 获取自己的优惠卷
	 * @param request
	 * @param tbYouhuiUser
	 * @param session
	 * @return
	 */
	@RequestMapping("/querySelf")
	@ResponseBody
    public List<HashMap> querySelf(HttpServletRequest request,TbYouhuiUser tbYouhuiUser,HttpSession session){
    	ResultAction rs = new ResultAction();
    	tbYouhuiUser.setfUserUid((String)session.getAttribute("F_USER_ID")); 
    	List<HashMap> tbYouhuiUsers = tbYouhuiService.querySelf(tbYouhuiUser); 
    	return tbYouhuiUsers;
    }
    
    
}
