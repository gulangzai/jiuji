package com.lanbao;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.ServletResponseWrapper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.xml.ws.ResponseWrapper;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.filter.OncePerRequestFilter;
 
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;  

public class StateHtmlFilter implements  Filter {

	public static Logger  log=Logger.getLogger(StateHtmlFilter.class);  
	
	private boolean debug = true;
	String stres = "";
	private FilterConfig filterConfig = null;

	public void StateHtmlFilter(FilterConfig filterConfig) {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) throws IOException, ServletException { 
		HttpServletRequest request = (HttpServletRequest)req;  
		HttpServletResponse response = (HttpServletResponse) res;
//application/x-www-form-urlencoded
		Enumeration<String> enums = request.getHeaderNames(); 
		String requestType = request.getHeader("x-requested-with");  
		String contentType = request.getContentType();
		// 请求的uri
		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
        
		boolean flag = true;
		if(uri.indexOf("toHomeHeader")!=-1){
			flag = false;
		}else if(uri.indexOf("logout")!=-1){
			flag = false;
		}else if(uri.indexOf("toInformation")!=-1){
			flag = false;
		}
		if(uri.indexOf("toSingleProduct")!=-1){
			toSingleProject(request,response,chain);
		}else if(uri.indexOf("toProjectListPage")!=-1){
			toProjectList(request,response,chain);
		}else{
			//动态的不静态
			if(flag){	
				 //判断是否为ajax请求，默认不是  
			      boolean isAjaxRequest = false;  
		         if(!StringUtils.isBlank(request.getHeader("x-requested-with")) && request.getHeader("x-requested-with").equals("XMLHttpRequest")){  
			        isAjaxRequest = true;  
				 } else if(!StringUtils.isBlank(request.getContentType())&&request.getContentType().equals("application/x-www-form-urlencoded")){
					 isAjaxRequest = true;  
				 } 

				String path = ((HttpServletRequest) request).getServletPath();
				/////// stres="html"+path.substring(4);
				stres = path.substring(1); // 获取文件名
				String pString = request.getSession().getServletContext().getRealPath("/"); 
				if (!isAjaxRequest&&uri.indexOf("do") != -1) {	 
					int len = stres.length(); // 获取文件名的长度 
					int lastIndex = stres.lastIndexOf("/");
					String lastQianFolder = stres.substring(0, lastIndex);
					String lastHouFold = stres.substring(lastIndex+1);
					String strs = lastHouFold.substring(0,lastHouFold.length() - 3) + ".html"; // 定义静态文件的名称  
		           
					File htmlFile = new File(pString + "/html/"+lastQianFolder, strs); // 定义静态文件的存储路径 
					File folder = new File(pString + "/html/"+lastQianFolder);
					Date htmlDate = null;
					Date now = new Date();
					if(!folder.exists()){
						folder.mkdirs();
					}
					if(folder.exists()){
						if (htmlFile.exists()) {
							htmlDate = new Date(htmlFile.lastModified()); 
							//如果存在
						   request.getRequestDispatcher("/html/" + lastQianFolder+File.separator+strs + "").forward(request, response); 
						} else { 
							htmlFile.createNewFile();
							log.info("创建"+htmlFile.getAbsolutePath());
							if (debug || htmlDate == null || htmlDate.getDate() != now.getDate()) {
								WrapperedResponse responseWrapper = new WrapperedResponse(response); // 创建自定义的应答对象
								chain.doFilter(request, responseWrapper); // 完成过滤连的业务
								responseWrapper.getWriter().flush();
								FileOutputStream fileStream = new FileOutputStream(htmlFile);// 创建HTML文件的输出流
								DataOutputStream fout = new DataOutputStream(fileStream); // 创建数据输出流
								fout.write(responseWrapper.getResponseData());
								fout.close();
							} 
							request.getRequestDispatcher("/html/" + lastQianFolder+File.separator+strs + "").forward(request, response);
						}
					}  
				}else{
					chain.doFilter(request, response); // 完成过滤连的业务
				}
			}else{
				chain.doFilter(request, response); // 完成过滤连的业务
			} 
		} 
	}
	
	/**
	 * 商品分类列表
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void toProjectList(HttpServletRequest request,HttpServletResponse response,FilterChain chain) throws ServletException, IOException{
		String path = request.getSession().getServletContext().getRealPath("/");    
		String f_clsId = request.getParameter("f_clsId"); 
		File folder = new File(path+"/html/projectList");
		String htmlName = "/html/projectList/list_"+f_clsId+".html";
		File htmlFile = new File(path+""+htmlName);
		if(!folder.exists()){
			folder.mkdirs();
		}
		if(folder.exists()){
			if (htmlFile.exists()) { 
				//如果存在
			   request.getRequestDispatcher(htmlName).forward(request, response); 
			} else { 
				    htmlFile.createNewFile(); 
					WrapperedResponse responseWrapper = new WrapperedResponse(response); // 创建自定义的应答对象
					chain.doFilter(request, responseWrapper); // 完成过滤连的业务
					responseWrapper.getWriter().flush();
					FileOutputStream fileStream = new FileOutputStream(htmlFile);// 创建HTML文件的输出流
					DataOutputStream fout = new DataOutputStream(fileStream); // 创建数据输出流
					fout.write(responseWrapper.getResponseData());
					fout.close(); 
				   request.getRequestDispatcher(htmlName).forward(request, response);
			}
		}  
	}
	
	
	/**
	 * 单个商品
	 * @throws IOException 
	 * @throws ServletException 
	 */
	public void toSingleProject(HttpServletRequest request,HttpServletResponse response,FilterChain chain) throws ServletException, IOException{
		String path = request.getSession().getServletContext().getRealPath("/");    
		String f_parentSku = request.getParameter("f_parentSku"); 
		File folder = new File(path+"/html/singleProject");
		String htmlName = "/html/singleProject/project_"+f_parentSku+".html";
		File htmlFile = new File(path+""+htmlName);
		if(!folder.exists()){
			folder.mkdirs();
		}
		if(folder.exists()){
			if (htmlFile.exists()) { 
				//如果存在
			   request.getRequestDispatcher(htmlName).forward(request, response); 
			} else { 
				    htmlFile.createNewFile(); 
					WrapperedResponse responseWrapper = new WrapperedResponse(response); // 创建自定义的应答对象
					chain.doFilter(request, responseWrapper); // 完成过滤连的业务
					responseWrapper.getWriter().flush();
					FileOutputStream fileStream = new FileOutputStream(htmlFile);// 创建HTML文件的输出流
					DataOutputStream fout = new DataOutputStream(fileStream); // 创建数据输出流
					fout.write(responseWrapper.getResponseData());
					fout.close(); 
				   request.getRequestDispatcher(htmlName).forward(request, response);
			}
		}  
	}

	public void destroy() {

	}

	public void log(String msg) {
		filterConfig.getServletContext().log(msg);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}