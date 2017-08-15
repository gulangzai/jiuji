package com.jiuji.cn.shiro;

import java.util.List;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.jiuji.cn.business.tbuser.dao.TbUserDao;
import com.jiuji.cn.business.tbuser.model.TbUser;
import com.jiuji.cn.business.tbuser.service.TbUserService;

import com.lanbao.base.PageData;

public class UserRealm extends AuthorizingRealm {

	@Autowired
	TbUserDao tbUserDao;
	
	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	//认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException  {
		// TODO Auto-generated method stub
	    UsernamePasswordToken upToken = (UsernamePasswordToken) token;
		String username = (String) token.getPrincipal(); 
		String password = new String(upToken.getPassword());
		SimpleAuthenticationInfo authenticationInfo = null;
		PageData user;
	  
			user = tbUserDao.selectOnlyone(username,password);
			if(user==null){
				throw new UnknownAccountException(); 
			} 
			authenticationInfo= new SimpleAuthenticationInfo (
					   user.get("F_USER_ID"),
					   user.get("F_Password"),
					   getName()
		  );
	 
		 
		return authenticationInfo;
	}

}
