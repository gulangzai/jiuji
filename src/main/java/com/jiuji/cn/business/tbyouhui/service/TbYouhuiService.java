package com.jiuji.cn.business.tbyouhui.service;

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


public interface TbYouhuiService{

	void save(TbYouhuiUser tbYouhuiUser);

	public List<TbYouhuiUser> alreadyHad(TbYouhuiUser tbYouhuiUser);

	List<HashMap> querySelf(TbYouhuiUser tbYouhuiUser);

	TbYouhui queryMoneyById(TbYouhuiUser tbYouhuiUser);
 
 
}
