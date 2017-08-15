package com.jiuji.cn.business.tbyouhuiuser.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.transform.Transformers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jiuji.cn.business.tbproduct.modal.TbProduct;
/*import com.jiuji.cn.dao.TSendMessageMapper;*/
import com.jiuji.cn.business.tbuser.dao.TbUserDao; 
import com.jiuji.cn.business.tbuser.model.TbUser;
import com.jiuji.cn.exception.MsmException;
import com.jiuji.cn.model.TSendMessage; 
import com.jiuji.cn.business.tbuser.service.TbUserService;
import com.jiuji.cn.business.tbyouhui.dao.TbYouhuiDao;
import com.jiuji.cn.business.tbyouhui.model.TbYouhui;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.jiuji.cn.business.tbyouhui.service.TbYouhuiService;
import com.jiuji.cn.business.tbyouhuiuser.dao.TbYouhuiUserDao;
import com.jiuji.cn.business.tbyouhuiuser.service.TbYouhuiUserService;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 
import com.lanbao.utils.IDGenertor;
import com.lanbao.utils.MD5Utils;
import com.lanbao.utils.SendMsg_webchinese;
import com.lanbao.utils.StringUtil;


@Service("tbYouhuiUserService")
public class TbYouhuiUserServiceImpl implements TbYouhuiUserService {
	
	private final Logger logger = LoggerFactory.getLogger(TbYouhuiUserServiceImpl.class);
    
	@Autowired
	TbYouhuiUserDao tbYouhuiUserDao;
	
	@Override
	public void save(TbYouhuiUser tbYouhuiUser) {
		// TODO Auto-generated method stub
		tbYouhuiUserDao.h_save(tbYouhuiUser);
	}

  

	@Override
	public void update(TbYouhuiUser tyu) {
		// TODO Auto-generated method stub
		tbYouhuiUserDao.h_update(tyu);
	}
	
	

	
 
	
}
