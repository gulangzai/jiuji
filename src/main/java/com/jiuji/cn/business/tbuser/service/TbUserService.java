package com.jiuji.cn.business.tbuser.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jiuji.cn.business.tbuser.model.TbUser;

import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 


public interface TbUserService{

	String login(String username, String password, String checkboxmark, Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session);

	com.lanbao.base.ResultAction register(String mobile, String password, String checkCode);

	ResultAction registerUser(HttpServletRequest request,String username,String mobile, String password, String email);

	ResultAction getUserById(String f_USER_ID) throws Exception;

	ResultAction updateUser(PageData pd)  throws Exception;

	ResultAction checkUsername(HttpServletRequest request, String username, String mobile, String password,
			String email)throws Exception;
	
	ResultAction checkEmail(HttpServletRequest request, String username, String mobile, String password,
			String email)throws Exception;
	
	ResultAction checkMobile(HttpServletRequest request, String username, String mobile, String password,
			String email)throws Exception;

	PageData getUserByFuserId(String f_user_id) throws Exception;

	ResultAction haveNoAccountUserQQbing(HttpServletRequest request, String username, String mobile, String password,
			String email, String f_OPEN_ID,String F_NickName,String code)throws Exception;

	ResultAction haveAccountUserQQbing(HttpServletRequest request, String username, String mobile, String password,
			String email, String f_OPEN_ID,String F_NickName, String code) throws Exception;
	
	ResultAction sendCode(String mobile);

	
	

}
