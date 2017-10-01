package com.jiuji.cn.business.tbyouhui.service.impl;

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
import com.jiuji.cn.business.tbuser.service.TbUserService;
import com.jiuji.cn.business.tbyouhui.dao.TbYouhuiDao;
import com.jiuji.cn.business.tbyouhui.model.TbYouhui;
import com.jiuji.cn.business.tbyouhui.model.TbYouhuiUser;
import com.jiuji.cn.business.tbyouhui.service.TbYouhuiService;
import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 
import com.lanbao.utils.IDGenertor;
import com.lanbao.utils.MD5Utils;
import com.lanbao.utils.SendMsg_webchinese;
import com.lanbao.utils.StringUtil;


@Service
public class TbYouhuiServiceImpl implements TbYouhuiService {
	
	private final Logger logger = LoggerFactory.getLogger(TbYouhuiServiceImpl.class);
    
	@Autowired
	TbYouhuiDao tbYouhuiDao;
	
	@Override
	public void save(TbYouhuiUser tbYouhuiUser) {
		// TODO Auto-generated method stub
		tbYouhuiDao.h_save(tbYouhuiUser);
	}

	@Override 
	public List<TbYouhuiUser> alreadyHad(TbYouhuiUser tbYouhuiUser) {
		// TODO Auto-generated method stub
		return tbYouhuiDao.h_findBy(TbYouhuiUser.class, "fUserUid", tbYouhuiUser.getfUserUid());
	}
	
	@Override 
	public List<HashMap> querySelf(TbYouhuiUser tbYouhuiUser) {
		// TODO Auto-generated method stub
		HashMap<String, String> map  = new HashMap();
		map.put("F_USER_ID", tbYouhuiUser.getfUserUid());
		String sql = "select  tyu.F_YOUHUI_USER_UID,tyu.F_YOUHUI_CODE,ty.F_MONEY  from  tb_youhui ty , tb_youhui_user tyu where ty.F_YOUHUI_UID = tyu.F_YOUHUI_UID AND DATE(NOW())< tyu.F_TIME_OUT AND tyu.F_USER_UID=:F_USER_ID";
        SQLQuery sqlQuery =  tbYouhuiDao.h_createSQLQuery(sql, map);
        return sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list(); 
	}
	
	@Override 
	public TbYouhui queryMoneyById(TbYouhuiUser tbYouhuiUser) {
		// TODO Auto-generated method stub
		HashMap<String, String> map  = new HashMap();
		map.put("F_USER_ID", tbYouhuiUser.getfUserUid());
		map.put("fYouhuiUserUid", tbYouhuiUser.getfYouhuiUserUid());
		String sql = "select ty.F_MONEY as FMoney,ty.F_YOUHUI_UID as F_YOUHUI_UID,ty.F_XUHAO as FXuhao, ty.F_YOUHUI_NAME as FYouhuiName,ty.F_YOUHUI_CODE as FYouhuiCode,ty.F_YOUHUI_TYPE as FYouhuiType,ty.F_MONEY as FMoney   From tb_youhui_user  tyu, tb_youhui ty where  tyu.F_YOUHUI_UID = ty.F_YOUHUI_UID AND tyu.F_IS_USED='1' AND tyu.F_YOUHUI_USER_UID=:fYouhuiUserUid ";
        SQLQuery sqlQuery =  tbYouhuiDao.h_createSQLQuery(sql, map);
       // return sqlQuery.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP).list(); 
       return (TbYouhui) sqlQuery.addEntity(TbYouhui.class).uniqueResult();
	} 
	
}
