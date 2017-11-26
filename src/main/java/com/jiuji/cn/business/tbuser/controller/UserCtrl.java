package com.jiuji.cn.business.tbuser.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.web.session.mgt.WebSessionKey;
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
import com.jiuji.cn.business.tbuser.dao.TbUserDao;
import com.jiuji.cn.business.tbuser.service.TbUserService;

import com.lanbao.base.ResultAction;
import com.lanbao.base.Suggestion;
import com.lanbao.controller.BaseController;
import com.lanbao.utils.MD5Utils; 
import com.lanbao.base.PageData;


@Controller
@RequestMapping("/userCtrl")
public class UserCtrl extends BaseController {
	
	@Autowired
	TbUserService userService;
	
	@Autowired
	TbUserDao tbUserDao;
	
	Cookie cookieName = null;
	Cookie cookiePass = null;
	Cookie cookieCheckboxmark = null;
	
	@RequestMapping("/login") 
	public String login(String username,String password,String checkboxmark,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		ResultAction result = new ResultAction();
		String errorMessage = "";  
		Subject user = SecurityUtils.getSubject(); 
		UsernamePasswordToken token  = null;
		try { 
			createCookies(request); 
			String newPass = MD5Utils.createMD5(password);
			token = new UsernamePasswordToken(username,newPass); 
			 cookieCheckboxmark.setValue(checkboxmark);
			
	    	 if("1".equals(checkboxmark)){
	    		 token.setRememberMe(true);
        		 //记住cooker 
                 //修改cookie信息的值
                 cookieName.setValue(username);
                 cookiePass.setValue(password);
                 
        		 cookieName.setMaxAge(Integer.MAX_VALUE);
        		 cookiePass.setMaxAge(Integer.MAX_VALUE); 
        	 }else{
        	    //删除cookie
        		//重新修改值
                 cookieName.setValue(username);  
                 cookiePass.setValue("DELETEPASSWORD");
        		 //cookiePass.setMaxAge(0);  
        		 token.setRememberMe(false);
        	 }
	    	 response.addCookie(cookieCheckboxmark);
	    	 response.addCookie(cookieName);
	     	 response.addCookie(cookiePass);
	     	 
	     	 //ensureUserIsLoggedOut();
	    	 user.login(token);
			 String userId = (String) user.getPrincipal();  
			 PageData userBean = userService.getUserByFuserId(userId);
	         session.setAttribute("F_USER_ID", userId);  
	         session.setAttribute("USERNAME", userBean.getString("F_UserName")); 
	         session.setAttribute("FDEGREE", userBean.getString("F_DEGREE")); 
	         model.addAttribute(userBean);
	         //ckeditor和ckfinder
	         session.setAttribute("CKFinder_UserRole", "admin");
	           
	         if (user.isAuthenticated()) {   
	             return  "redirect:/homePageCtrl/toHomePage.do"; //"/modules/homepage/homepage";  
	         }  
	   } catch (UnknownAccountException uae) {  
            errorMessage = "用户认证失败:" + "用户不存在此系统中";  
            token.clear(); 
        } catch (IncorrectCredentialsException ice) {  
            errorMessage = "用户认证失败:" + "密码不匹配";  
            token.clear(); 
        } catch (LockedAccountException lae) {  
            errorMessage = "用户认证失败:" + "用户被锁不能登录";  
            token.clear(); 
        } catch (AuthenticationException e) {  
            errorMessage = "登录失败错误信息:" + e;  
            e.printStackTrace();  
            token.clear();  
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			token.clear(); 
			return "/modules/homepage/login";
		} 
		
	    session.setAttribute("ErrorMessage", errorMessage);  
	    result.setMessage(errorMessage);
	    result.setIserror(true);
	    model.addAttribute("result", result);
		return "/modules/homepage/login";
	}
	
	private void ensureUserIsLoggedOut()
	{
	    try
	    {
	        // Get the user if one is logged in.
	        Subject currentUser = SecurityUtils.getSubject();
	        if (currentUser == null)
	            return;

	        // Log the user out and kill their session if possible.
	        currentUser.logout();
	        Session session = currentUser.getSession(false);
	        if (session == null)
	            return;

	        session.stop();
	    }
	    catch (Exception e)
	    {
	        // Ignore all errors, as we're trying to silently 
	        // log the user out.
	    }
	}
	
	
	@RequestMapping("/isAuthenticated") 
	@ResponseBody
	public boolean isAuthenticated(String sessionID,HttpServletRequest request,HttpServletResponse response){
		boolean status = false;
		SessionKey key = new WebSessionKey(sessionID,request,response);
		try{
            Session se = SecurityUtils.getSecurityManager().getSession(key);
            Object obj = se.getAttribute(DefaultSubjectContext.AUTHENTICATED_SESSION_KEY);
            if(obj != null){
                status = (Boolean) obj;
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Session se = null;
            Object obj = null;
        }
		
		
		

        return status;
	}
	
	
	@RequestMapping("/wapLogin") 
	@ResponseBody
	public ResultAction wapLogin(String username,String password,String checkboxmark,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session){  
		//String message =  userService.login(username,password,checkboxmark,model,request,response,session);  
		ResultAction result = new ResultAction();
		String errorMessage = "";  
		Subject user = SecurityUtils.getSubject(); 
		UsernamePasswordToken token  = null;
		try {
			
			String newPass = MD5Utils.createMD5(password);
			token = new UsernamePasswordToken(username,newPass);
			token.setRememberMe(true);
			
			 user.login(token);
			 String userID = (String) user.getPrincipal();  
	         session.setAttribute("F_USER_ID", userID);  
	         session.setAttribute("USERNAME", username);  
	         if (user.isAuthenticated()) {   
	        	 result.setData("/homePageCtrl/toWapHomePage.do");
	        	 result.setIserror(false);
	        	 return  result; //"/modules/homepage/homepage";  
	         }  
	   } catch (UnknownAccountException uae) {  
            errorMessage = "用户认证失败：" + "用户不存在此系统中.";  
        } catch (IncorrectCredentialsException ice) {  
            errorMessage = "用户认证失败：" + "密码不匹配.";  
        } catch (LockedAccountException lae) {  
            errorMessage = "用户认证失败：" + "用户被锁不能登录.";  
        } catch (AuthenticationException e) {  
            errorMessage = "登录失败错误信息：" + e;  
            e.printStackTrace();  
            token.clear();  
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	    session.setAttribute("ErrorMessage", errorMessage);  
	    result.setMessage(errorMessage);
	    result.setIserror(true);
	    model.addAttribute("result", result);
		return result;
	}
	
	
	@RequestMapping("/register1")
	@ResponseBody
	public ResultAction register1(String mobile,String password,String checkCode){
		ResultAction ra = userService.register(mobile,password,checkCode);
		return ra;
	}
	
	@RequestMapping("/registerUser")
	@ResponseBody
	public ResultAction registerUser(HttpSession session,HttpServletRequest request,String username,String mobile,String password,String email) throws Exception{
		ResultAction ra = userService.registerUser(request,username,mobile,password,email);
		UsernamePasswordToken token  = null;
		if("SUCCESS".equals(ra.getMessage())){
			Subject user = SecurityUtils.getSubject(); 
			String newPass = MD5Utils.createMD5(password);
			token = new UsernamePasswordToken(username,newPass);
			token.setRememberMe(true); 
			 user.login(token);
			 String userID = (String) user.getPrincipal();  
	         session.setAttribute("F_USER_ID", userID);  
	         session.setAttribute("USERNAME", username);  
		}
		return ra;
	}
	
	/**
	 * 有账号时,QQ接口 绑定
	 */
	@RequestMapping("/haveAccountUserQQbing")
	@ResponseBody
	public ResultAction haveAccountUserQQbing(HttpSession session,HttpServletRequest request,String username,String mobile,String password,String email,String F_OPEN_ID,String F_NickName,String code){
		ResultAction ra = new ResultAction();
		try { 
			ra = userService.haveAccountUserQQbing(request,username,mobile,password,email,F_OPEN_ID,F_NickName,code);
			UsernamePasswordToken token  = null;
			if("SUCCESS".equals(ra.getMessage())){
				
				PageData pd = new PageData();
				pd.put("F_Mobile", mobile);  
				List<PageData> tusers = tbUserDao.select(pd);
			    if(tusers.size()>0){
			    	PageData tbuser = tusers.get(0);
			    	String ausername = tbuser.getString("F_UserName");
			    	String anewPass = tbuser.getString("F_Password");
			    	Subject user = SecurityUtils.getSubject();  
					token = new UsernamePasswordToken(ausername,anewPass);
					token.setRememberMe(true); 
					 user.login(token);
					 String userID = (String) user.getPrincipal();  
			         session.setAttribute("F_USER_ID", tbuser.getString("F_USER_ID"));  
			         session.setAttribute("USERNAME", tbuser.getString("F_UserName"));  
			    }
				
			} 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ra.setMessage("FAIL");
		}
		return ra;
	}
	 
	
	/**
	 * 无账号时,QQ接口 绑定
	 */
	@RequestMapping("/haveNoAccountUserQQbing")
	@ResponseBody
	public ResultAction haveNoAccountUserQQbing(HttpSession session,HttpServletRequest request,String username,String mobile,String password,String email,String F_OPEN_ID,String F_NickName,String code) throws Exception{
		ResultAction ra = userService.haveNoAccountUserQQbing(request,username,mobile,password,email,F_OPEN_ID,F_NickName,code);
		UsernamePasswordToken token  = null;
		if("SUCCESS".equals(ra.getMessage())){
			Subject user = SecurityUtils.getSubject(); 
			String newPass = MD5Utils.createMD5(password);
			token = new UsernamePasswordToken(username,newPass);
			token.setRememberMe(true); 
			 user.login(token);
			 String userID = (String) user.getPrincipal();  
	         session.setAttribute("F_USER_ID", userID);  
	         session.setAttribute("USERNAME", username);  
		}
		return ra;
	}
	
	
	@RequestMapping("/checkUsername")
	@ResponseBody
	public void checkUsername(HttpSession session,HttpServletRequest request,HttpServletResponse response,String username,String mobile,String password,String email) throws Exception{
		//response.setCharacterEncoding("GBK");
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		ResultAction ra = userService.checkUsername(request,username,mobile,password,email); 
		net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(ra);
		//out.print(object.toString());
		out.println(!ra.getIserror());
	}
	
	@RequestMapping("/checkEmail")
	@ResponseBody
	public void checkEmail(HttpSession session,HttpServletRequest request,HttpServletResponse response,String username,String mobile,String password,String email) throws Exception{
		//response.setCharacterEncoding("GBK");
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		ResultAction ra = userService.checkEmail(request,username,mobile,password,email); 
		net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(ra);
		//out.print(object.toString());
		out.println(!ra.getIserror());
	}
	
	@RequestMapping("/checkMobile")
	@ResponseBody
	public void checkMobile(HttpSession session,HttpServletRequest request,HttpServletResponse response,String username,String mobile,String password,String email) throws Exception{
		//response.setCharacterEncoding("GBK");
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		ResultAction ra = userService.checkMobile(request,username,mobile,password,email); 
		net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(ra);
		//out.print(object.toString());
		out.println(!ra.getIserror());
	}
	

	@RequestMapping("/haveAccountCheckMobile")
	@ResponseBody
	public void haveAccountCheckMobile(HttpSession session,HttpServletRequest request,HttpServletResponse response,String username,String mobile,String password,String email) throws Exception{
		//response.setCharacterEncoding("GBK");
		response.setContentType("application/x-json");
		PrintWriter out = response.getWriter();
		ResultAction ra = userService.checkMobile(request,username,mobile,password,email); 
		net.sf.json.JSONObject object = net.sf.json.JSONObject.fromObject(ra);
		//out.print(object.toString());
		out.println(ra.getIserror());
	}
	
	
	
	   /**
     * 发送验证码
     * @param mobile
     * @return
     */
    @RequestMapping(value="/sendCode")
    @ResponseBody
    public ResultAction sendCode(String mobile){
    	return userService.sendCode(mobile);
    }
	
	
	
	 
	
	@RequestMapping("/toLwj") 
    public String toLwj(){ 
		return "/modules/person/lwj";
	}
	
	@RequestMapping(value="getUser")
	@ResponseBody
	public ResultAction getUser(HttpSession session){
		String F_USER_ID = (String) session.getAttribute("F_USER_ID");
		ResultAction ra = null;
		try {
			ra = userService.getUserById(F_USER_ID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ra;
	}
	
	@RequestMapping(value="updateUser")
	@ResponseBody
	public ResultAction updateUser(HttpSession session){
		String F_USER_ID = (String) session.getAttribute("F_USER_ID");
		ResultAction ra = null;
		PageData pd  = this.getPageData();
		try {
			ra = userService.updateUser(pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ra;
	}
	
	
    /** 
     * 用户登出 
     */  
    @RequestMapping(value="/logout",method=RequestMethod.GET)  
    public String logout(HttpServletRequest request){  
         SecurityUtils.getSubject().logout();  
         //String logout = InternalResourceViewResolver.FORWARD_URL_PREFIX + "/homePageCtrl/toLogin.do";
         String logout = "/modules/homepage/login";
         return logout;  
    } 
    
    /**
     * 创建cookie对象
     * @param request
     */
    private void createCookies(HttpServletRequest request) {
        //获取所有的cookie对象
        Cookie cookies[] = request.getCookies();
        if (cookies != null) {
            for (Cookie ck : cookies) {
                //获取cookie的名称
                String name = ck.getName();
                //判断
                if ("userName".equals(name)) {
                    cookieName = ck;
                } else if ("pass".equals(name)) {
                    cookiePass = ck;
                }else if("checkboxmark".equals(name)){
                	cookieCheckboxmark = ck;
                }
            }
        }

        //创建要存储用户名的cookie对象
        if (cookieName == null) {
            cookieName = new Cookie("userName", "1");
        }
        //创建要存储用户密码的cookie对象
        if (cookiePass == null) {
            cookiePass = new Cookie("pass", "1");
        }
        //
        if (cookieCheckboxmark == null) {
        	cookieCheckboxmark = new Cookie("checkboxmark", "0");
        }
        
    }
    
    
}
