package com.jiuji.cn.business.fileUpload.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jiuji.cn.business.fileUpload.service.FileUploadService;
import com.lanbao.base.ResultAction; 
import com.lanbao.utils.UserAgentUtil; 

@Controller
@RequestMapping("/fileUploadController")
public class FileUploadController {
 
	@Autowired
	FileUploadService ser;
	/**
	 * 根据项目ID查询附件方法
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryFileByTargetUid")
	@ResponseBody
	public ResultAction queryFileByTargetUid(HttpServletRequest request) throws Exception {
		ResultAction j = new ResultAction(); 
		List<Map<String, Object>> list = ser.queryFileByTargetUid(request);
		j.setIserror(false);
		j.setData(list);
		return j;
	}
	
	
	 /**
     * 文件上传时执行
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     * 
     */
   @RequestMapping("/springUpload")
   @ResponseBody
   public void springUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       if (!ServletFileUpload.isMultipartContent(request)) {
           throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
       }

       String encoding = request.getCharacterEncoding();
       encoding = StringUtils.isBlank(encoding)?"utf-8":encoding;
       response.setCharacterEncoding(encoding);
	    PrintWriter writer = response.getWriter();
	    response.setContentType("application/json");
	    String uploadType = request.getParameter("uploadType");
	    org.json.JSONArray json = new org.json.JSONArray();
	    try { 
       	json = ser.doInsert(request);  
       }  catch (Exception e) {
    	   e.printStackTrace();
               throw new RuntimeException(e);
       } finally {
           writer.write(json.toString());
           writer.close();
       } 
   }
   
	 
	
	
  

}
