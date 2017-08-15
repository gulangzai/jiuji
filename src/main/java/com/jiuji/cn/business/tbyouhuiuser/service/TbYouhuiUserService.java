package com.jiuji.cn.business.tbyouhuiuser.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.jiuji.cn.business.tbuser.model.TbUser;
import com.jiuji.cn.business.tbyouhui.model.TbYouhui;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 


public interface TbYouhuiUserService{

	void save(TbYouhuiUser tbYouhuiUser); 

	void update(TbYouhuiUser tyu);
 
}
