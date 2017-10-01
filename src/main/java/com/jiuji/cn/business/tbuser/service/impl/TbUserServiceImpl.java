package com.jiuji.cn.business.tbuser.service.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.Map;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jiuji.cn.business.tbsendmessage.dao.TbSendMessageDao;
import com.jiuji.cn.business.tbsendmessage.service.TbSendMessageService;
import com.jiuji.cn.business.tbsendmessage.vo.TbSendMessage;
/*import com.jiuji.cn.dao.TSendMessageMapper;*/
import com.jiuji.cn.business.tbuser.dao.TbUserDao; 
import com.jiuji.cn.business.tbuser.model.TbUser;
import com.jiuji.cn.exception.MsmException; 
import com.jiuji.cn.business.tbuser.service.TbUserService;

import com.lanbao.base.PageData;
import com.lanbao.base.ResultAction; 
import com.lanbao.utils.IDGenertor;
import com.lanbao.utils.MD5Utils;
import com.lanbao.utils.SendMsg_webchinese;
import com.lanbao.utils.StringUtil;


@Service
public class TbUserServiceImpl implements TbUserService {
	
	private final Logger logger = LoggerFactory.getLogger(TbUserServiceImpl.class);
/*	@Autowired
	UserMapper userMapper;*/
/*	@Autowired
	TSendMessageMapper tsendMessageMapper;*/
	
	@Autowired
	public TbUserDao tbUserDao;
	
	@Autowired
	public TbSendMessageDao tbSendMessageDao;
	
	@Autowired
	public TbSendMessageService tbSendMessageService;
	
	
	@Override
	public String login(String username,String password,String checkboxmark,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){
		System.out.println("userName:"+username+"password:"+password+"checkboxmark:"+checkboxmark);
		//String fromUrl = (String)request.getParameter("fromUrl");
		ResultAction ra = new ResultAction();
		try {
			if(username ==null||username.equals("") || password== null||password.equals("")){ 
				ra.setIserror(true);
				ra.setMessage("用户名和密码不能为空!");
				model.addAttribute("result",ra); 
				return "/modules/homepage/login";
			}
			String newpassword = MD5Utils.createMD5(password);
			TbUser t_user = new TbUser();
			t_user.setFUserName(username);
			t_user.setFPassword(newpassword);
			//判断是否是手机号
			 Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");  
			 Matcher m = p.matcher(username);  
			 if(m.matches()){
				 t_user.setFUserName(null);
				 t_user.setFMobile(username);
				 t_user.setFPassword(newpassword);
			 }  
			 //判断是否是邮箱
			 p = Pattern.compile("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\\.([a-zA-Z0-9_-])+)+$");
			 m=p.matcher(username);
			 if(m.matches()){
				 t_user.setFUserName(null);
				 t_user.setFEmail(username);
				 t_user.setFPassword(newpassword);
			 }
			 
			TbUser rt_user = (TbUser) tbUserDao.r_get(t_user.getFUserName(), null);
			if(rt_user==null){
				//t_user = userMapper.selectOnlyone(t_user);  
				com.lanbao.utils.CookieUtil cookieUtil = new com.lanbao.utils.CookieUtil();
				if(t_user != null&&newpassword.equals(t_user.getFPassword())){
					session.setAttribute("t_user", t_user);
					session.setAttribute("loginname", t_user); 
					t_user.setFPassword(newpassword); 
					
					tbUserDao.r_put(t_user.getFUserName(),t_user, TbUser.class);
					
					if(checkboxmark=="1"||checkboxmark.equals("1")){
						cookieUtil.addCookie(response, "userName",username, 7*24*60*60); 
						cookieUtil.addCookie(response,"password",password,7*24*60*60);
						cookieUtil.addCookie(response,"checkboxmark",checkboxmark,7*24*60*60); 
					} else{
						cookieUtil.delCookie(request, "userName", response);
						cookieUtil.delCookie(request, "password", response);
						cookieUtil.delCookie(request, "checkboxmark", response);
					}
					/* SessionListener.replaceUserSession(session, teacher.getUserId());
				    teacher.setLastLoginTime(teacher.getCurrentLoginTime());
					teacher.setCurrentLoginTime(DateUtils.getTodayTime());
					studentInfoService.updateByPrimaryKeySelective(teacher);*/
				    logger.info("-------登录成功");
					return "redirect:/homePageCtrl/toHomePage.do"; 	 
				}else{ 
					
					ra.setIserror(true);
					ra.setMessage("用户名和密码不匹配!");
					model.addAttribute("result",ra);  
					return "/modules/homepage/login";
				}
				
			} else{
				com.lanbao.utils.CookieUtil cookieUtil = new com.lanbao.utils.CookieUtil();
				if(rt_user != null&&newpassword.equals(rt_user.getFPassword())){
					session.setAttribute("t_user", rt_user);
					session.setAttribute("loginname", rt_user); 
					t_user.setFPassword(newpassword);  
					tbUserDao.r_put(t_user.getFUserName(),rt_user, TbUser.class);
					
					if(checkboxmark=="1"||checkboxmark.equals("1")){
						cookieUtil.addCookie(response, "userName",username, 7*24*60*60); 
						cookieUtil.addCookie(response,"password",password,7*24*60*60);
						cookieUtil.addCookie(response,"checkboxmark",checkboxmark,7*24*60*60); 
					} else{
						cookieUtil.delCookie(request, "userName", response);
						cookieUtil.delCookie(request, "password", response);
						cookieUtil.delCookie(request, "checkboxmark", response);
					} 
				    logger.info("-------登录成功");
					return "redirect:/homePageCtrl/toHomePage.do"; 	 
				}else{ 
				 	tbUserDao.r_delete(t_user.getFUserName());
					    //t_user = userMapper.selectOnlyone(t_user);  
					    cookieUtil = new com.lanbao.utils.CookieUtil();
						if(t_user != null&&newpassword.equals(t_user.getFPassword())){
							session.setAttribute("t_user", t_user);
							session.setAttribute("loginname", t_user); 
							t_user.setFPassword(newpassword); 
							
							tbUserDao.r_put(t_user.getFUserName(),t_user,TbUser.class);
							
							if(checkboxmark=="1"||checkboxmark.equals("1")){
								cookieUtil.addCookie(response, "userName",username, 7*24*60*60); 
								cookieUtil.addCookie(response,"password",password,7*24*60*60);
								cookieUtil.addCookie(response,"checkboxmark",checkboxmark,7*24*60*60); 
							} else{
								cookieUtil.delCookie(request, "userName", response);
								cookieUtil.delCookie(request, "password", response);
								cookieUtil.delCookie(request, "checkboxmark", response);
							} 
						    logger.info("-------登录成功");
							return "redirect:/homePageCtrl/toHomePage.do"; 	 
						}else{
							model.addAttribute("message","用户名和密码不匹配!");
							return "/modules/homepage/login";
						}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return "/modules/homepage/login"; 
	}



 



	/**
	 * 注册接口
	 */
	@Override
	public ResultAction register(String mobile, String password,String checkCode) {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			password = MD5Utils.createMD5(password);	
			TbUser tuser = new TbUser();  
			tuser.setFMobile(mobile);
			List<TbUser> tusers = null; //userMapper.select(tuser);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("EXIST");
			}else{
				TbSendMessage tsendMessage = new TbSendMessage(mobile,checkCode);
				//tsendMessage = tsendMessageMapper.selectOnlyone(tsendMessage);
				if(tsendMessage!=null){
					tuser = new TbUser(mobile,password);
					tuser.setFUserId(StringUtil.getKey());
					tuser.setFDeleted(0);
					tuser.setFPassword(password);
					System.out.println(tuser);
					//userMapper.insert(tuser);
					ra.setMessage("SUCCESS");
				}else{
					ra.setMessage("ERRORCODE");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("FAIL");
		}
	     return ra; 
	}
	
	/**
	 * 注册接口
	 */
	@Override
	public ResultAction registerUser(HttpServletRequest request,String username,String mobile, String password,String email) {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			String real_password = password;
			password = MD5Utils.createMD5(password);	
			TbUser tuser = new TbUser();  
			tuser.setFMobile(mobile);
			PageData pd = new PageData();
			pd.put("F_Mobile", mobile);
			pd.put("F_Email", email);
			pd.put("F_Password", password);
			pd.put("F_UserName", username);
			List<PageData> tusers = tbUserDao.select(pd);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("EXIST");
			}else{ 
				tuser = new TbUser(mobile,password);
				tuser.setFUserId(StringUtil.getKey());
				tuser.setFUserName(username); 
				tuser.setFDeleted(1);
				tuser.setFPassword(password);
				tuser.setFEmail(email);
				System.out.println(tuser);
				pd.put("F_USER_ID", StringUtil.getKey());
				pd.put("F_Deleted", "1");
				pd.put("F_Sex", 2);
				pd.put("F_RealPassword", real_password);
				pd.put("F_Ip", request.getRemoteHost());
				tbUserDao.mb_save("TbUserMapper.insert",pd);
				ra.setMessage("SUCCESS"); 
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("FAIL");
		}
	     return ra; 
	}
	
	/**
	 *  有账号时,QQ接口 绑定
	 * @throws Exception 
	 */
	@Override
	public ResultAction haveAccountUserQQbing(HttpServletRequest request,String username,String mobile, String password,String email,String F_OPEN_ID,String F_NickName,String code) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		   ResultAction ra = new ResultAction(); 
			TbUser tuser = new TbUser();  
			tuser.setFMobile(mobile);
			PageData pd = new PageData();
			pd.put("F_Mobile", mobile);  
			List<PageData> tusers = tbUserDao.select(pd);
			if(tusers!=null&&tusers.size()>0){
				//查询发送code表
				HashMap map = new HashMap();
				map.put("F_Mobile", mobile);
				map.put("F_Checkcode", code);
				List<TbSendMessage> tbSendMessages = tbSendMessageDao.h_find("from TbSendMessage where F_Mobile=:F_Mobile and F_Checkcode = :F_Checkcode", map);
				if(tbSendMessages.size()!=0){  
					PageData bingQQUser = tusers.get(0); 
					bingQQUser.put("F_OPEN_ID", F_OPEN_ID);
					bingQQUser.put("F_NickName", F_NickName);
					tbUserDao.mb_save("TbUserMapper.update",bingQQUser);
					ra.setMessage("SUCCESS");  
				}else{
					ra.setMessage("ERRORCODE");
				} 
			}else{
				ra.setMessage("NOEXIST");
			}  
	     return ra; 
	}
	
	
	/**
	 * 无账号时,QQ接口 绑定
	 */
	@Override
	public ResultAction haveNoAccountUserQQbing(HttpServletRequest request,String username,String mobile, String password,String email,String F_OPEN_ID,String F_NickName,String code)throws Exception {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			String real_password = password;
			password = MD5Utils.createMD5(password);	
			TbUser tuser = new TbUser();  
			tuser.setFMobile(mobile);
			PageData pd = new PageData();
			pd.put("F_Mobile", mobile);
			pd.put("F_Email", email);
			pd.put("F_Password", password);
			pd.put("F_UserName", username);
			pd.put("F_OPEN_ID", F_OPEN_ID);
			List<PageData> tusers = tbUserDao.select(pd);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("EXIST");
			}else{ 
				HashMap map = new HashMap();
				map.put("F_Mobile", mobile);
				map.put("F_Checkcode", code);
				List<TbSendMessage> tbSendMessages = tbSendMessageDao.h_find("from TbSendMessage where F_Mobile=:F_Mobile and F_Checkcode = :F_Checkcode", map);
				if(tbSendMessages.size()!=0){  
				tuser = new TbUser(mobile,password);
				tuser.setFUserId(StringUtil.getKey());
				tuser.setFUserName(username); 
				tuser.setFDeleted(1);
				tuser.setFPassword(password);
				tuser.setFEmail(email);
				System.out.println(tuser);
				pd.put("F_USER_ID", StringUtil.getKey());
				pd.put("F_Deleted", "1");
				pd.put("F_Sex", 2);
				pd.put("F_RealPassword", real_password);
				pd.put("F_Ip", request.getRemoteHost());
				pd.put("F_NickName", F_NickName);
				tbUserDao.mb_save("TbUserMapper.insert",pd);
				ra.setMessage("SUCCESS"); 
				}else{
					ra.setMessage("ERRORCODE");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("FAIL");
		}
	     return ra; 
	}
	
	
	/**
	 * check 用户
	 */
	@Override
	public ResultAction checkUsername(HttpServletRequest request,String username,String mobile, String password,String email) {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			TbUser tuser = new TbUser();   
			PageData pd = new PageData(); 
			pd.put("F_UserName", username);
			List<PageData> tusers = tbUserDao.checkUsername(pd);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("用户名已存在");
				ra.setIserror(true); 
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("服务器异常");
		}
	     return ra; 
	}
	
	
	/**
	 * check 邮箱
	 */
	@Override
	public ResultAction checkEmail(HttpServletRequest request,String username,String mobile, String password,String email) {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			TbUser tuser = new TbUser();   
			PageData pd = new PageData();  
			pd.put("F_Email", email);
			List<PageData> tusers = tbUserDao.checkEmail(pd);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("该邮箱已用");
				ra.setIserror(true); 
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("服务器异常");
		}
	     return ra; 
	}
	
	/**
	 * check 邮箱
	 */
	@Override
	public ResultAction checkMobile(HttpServletRequest request,String username,String mobile, String password,String email) {
		// TODO Auto-generated method stub
		System.out.println(mobile+"---"+password);
		ResultAction ra = new ResultAction();
		try{ 
			TbUser tuser = new TbUser();   
			PageData pd = new PageData();  
			pd.put("F_Mobile", mobile);
			List<PageData> tusers = tbUserDao.checkMobile(pd);
			if(tusers!=null&&tusers.size()>0){
				ra.setMessage("该手机号已用");
				ra.setIserror(true); 
			}
		}catch(Exception e){
			e.printStackTrace();
			ra.setMessage("服务器异常");
		}
	     return ra; 
	}
	
	
	
	
	public ResultAction testCode(String mobile){
		ResultAction ra = new ResultAction();
		String checkcode = IDGenertor.randomCode(); 
		TbSendMessage tsendMessage = new TbSendMessage();
		tsendMessage.setFMobile(mobile); 
		/*try {
			List<TSendMessage> tsendMessages = tsendMessageMapper.select(tsendMessage);
			tsendMessage.setFCheckcode(checkcode);
			if(tsendMessages.size()>=1){
				tsendMessageMapper.update(tsendMessage);
			}else{ 
				tsendMessageMapper.insert(tsendMessage);
			}
			SendMsg_webchinese.sendMessage(mobile,checkcode); 
			ra.setMessage("SEND");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ra.setMessage("SENDERROR");
		} catch (MsmException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			ra.setMessage("SENDERROR");
		} */
		return ra;
	}

	/**
	 * 发送验证码
	 * @param mobile
	 * @return
	 */
	@Override
	public ResultAction sendCode(String mobile){
		ResultAction ra = new ResultAction();
		String checkcode = IDGenertor.randomCode(); 
		TbSendMessage tbsendMessage = new TbSendMessage();
		tbsendMessage.setFMobile(mobile); 
	    Map map = new HashMap();
	    map.put("FMobile", mobile);
		try {
			//List<TSendMessage> tsendMessages = tsendMessageMapper.select(tsendMessage);
			List<TbSendMessage> tbSendMessages = tbSendMessageDao.h_find("from TbSendMessage where  F_Mobile=:FMobile", map);
			tbsendMessage.setFCheckcode(checkcode);
			if(tbSendMessages.size()>=1){
				tbsendMessage = tbSendMessages.get(0);
				tbsendMessage.setFCheckcode(checkcode);
				Map map_para = new HashMap();
				map_para.put("F_Checkcode", checkcode);
				map_para.put("F_Mobile", mobile);
				Query query=tbSendMessageDao.h_createSQLQuery("update tb_sendmessage set F_Checkcode=:F_Checkcode where F_Mobile=:F_Mobile",map_para);
				query.executeUpdate(); 
				
				
			}else{ 
				tbSendMessageDao.h_save(tbsendMessage);
			}
			try {
				SendMsg_webchinese.sendMessage(mobile,checkcode);
			} catch (com.lanbao.exception.MsmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			ra.setMessage("SEND");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ra.setMessage("SENDERROR");
		//} catch (MsmException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			ra.setMessage("SENDERROR");
		}
		return ra;
	}
	






	@Override
	public ResultAction getUserById(String f_user_id) throws Exception {
		// TODO Auto-generated method stub
		ResultAction ra = new ResultAction();
		PageData pd = (PageData) tbUserDao.mb_findForObject("TbUserMapper.findUserById",f_user_id);
		ra.setData(pd);
		return ra;
	}
	
	@Override
	public PageData getUserByFuserId(String f_user_id) throws Exception { 
		PageData pd = (PageData) tbUserDao.mb_findForObject("TbUserMapper.findUserById",f_user_id); 
		return pd;
	}
	
	
	
	@Override
	public ResultAction updateUser(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		ResultAction ra = new ResultAction();
		pd = (PageData) tbUserDao.mb_findForObject("TbUserMapper.update",pd);
		ra.setData(pd);
		return ra;
	}

	 
	 

 
}
