package com.jiuji.cn.business.tbuser.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jiuji.cn.business.tbuser.dao.TbUserDao;
import com.jiuji.cn.business.tbuser.model.TbUser;

import com.lanbao.base.PageData;
import com.lanbao.dao.impl.BaseDaoImpl;
import com.lanbao.mybatis.impl.MyBatisBaseDaoImpl;


@Repository
public class TbUserDaoImpl<TbUser> extends BaseDaoImpl implements TbUserDao{
	
	 

	@Override
	public   PageData selectOnlyone(String username,String password){ 
		PageData pd = new PageData(); 
		
		pd.put("F_Password", password);
		try {
			pd.put("F_UserName", username);
			PageData byName = (PageData) mb_findForObject("TbUserMapper.selectByName", pd);
			if(byName!=null){
				return byName;
			}
			pd.put("F_Mobile", username);
			PageData byMobile = (PageData) mb_findForObject("TbUserMapper.selectByMobile", pd);
			if(byName!=null){
				return byMobile;
			}
			pd.put("F_Email", username);
			PageData byEmail = (PageData) mb_findForObject("TbUserMapper.selectByEmail", pd);
			if(byName!=null){
				return byEmail;
			}
			return null;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<PageData> registerSelect(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbUserMapper.registerSelect", pd);
	}
	
	@Override
	public List<PageData> select(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbUserMapper.select", pd);
	}
	
	
	@Override
	public List<PageData> checkUsername(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbUserMapper.registerSelectF_UserName", pd);
	}
	
	@Override
	public List<PageData> checkEmail(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbUserMapper.registerSelectF_Email", pd);
	}
	
	@Override
	public List<PageData> checkMobile(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) mb_findForList("TbUserMapper.registerSelectF_Mobile", pd);
	}
	
	

 
}
