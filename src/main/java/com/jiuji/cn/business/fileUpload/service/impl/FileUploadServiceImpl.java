package com.jiuji.cn.business.fileUpload.service.impl;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jiuji.cn.business.fileUpload.dao.FileUploadDao;
import com.jiuji.cn.business.fileUpload.service.FileUploadService;
import com.jiuji.cn.common.CommConfigVo;
import com.lanbao.base.PageData;

@Service
public class FileUploadServiceImpl implements FileUploadService{

	private static Logger logger = LoggerFactory.getLogger(FileUploadServiceImpl.class);

	@Autowired
    public FileUploadDao fileUploadDao;
	
	@Autowired
	public CommConfigVo commConfigVo;
	 
	public FileUploadServiceImpl() { 
	}
  
 
	
	/**
	 * 根据项目ID查询附件方法
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryFileByTargetUid(HttpServletRequest request) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); 
		ResultSetMetaData md = null;
		PreparedStatement ps = null;
		String filePath = "";
		try {
			String targetUid = request.getParameter("targetUid");
			String file_type = request.getParameter("file_type");
			HashMap paraMap = new HashMap();
			paraMap.put("targetUid", targetUid);
			paraMap.put("file_type", file_type);
			
			List<Map> rsList = (List) fileUploadDao.mb_findForList("TbFileMapper.findByTarget", paraMap);
		 
			for (Map map : rsList) {
				 
				String extName = map.get("FILE_EXT_NAME")==null?"":String.valueOf(map.get("FILE_EXT_NAME")).toLowerCase();
				filePath = commConfigVo.getFileRoot()+"/"+map.get("File_PATH");
				 
				String FILE_SIZE = String.valueOf(map.get("FILE_SIZE"))==""?"0":String.valueOf(map.get("FILE_SIZE")); 
				double item = Double.parseDouble(FILE_SIZE);
				Double d_size =  item/1024;
				DecimalFormat formater = new DecimalFormat("#.##"); 
            	String st=formater.format(d_size);  
				map.put("FILE_SIZE", st);
				map.put("url", filePath); 
				map.put("fileDir", commConfigVo.getFilePathDownload());
				list.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally { 
		}
		return list;
	}
	
 
	/**
	 * 获取文件扩展类型
	 * 
	 * @param file
	 * @return
	 */
	public String getMimeType(File file) {
		String mimetype = "";
		if (file.exists()) {
			if (getSuffix(file.getName()).equalsIgnoreCase("png")) {
				mimetype = "image/png";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpg")) {
				mimetype = "image/jpg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("jpeg")) {
				mimetype = "image/jpeg";
			} else if (getSuffix(file.getName()).equalsIgnoreCase("gif")) {
				mimetype = "image/gif";
			} else {
				javax.activation.MimetypesFileTypeMap mtMap = new javax.activation.MimetypesFileTypeMap();
				mimetype = mtMap.getContentType(file);
			}
		}
		return mimetype;
	}
	
	
	/**
	 * 
	 * @param request
	 * @param fileRoot
	 *            这个参数不再使用了
	 * @return
	 * @throws Exception
	 */
	public JSONArray doInsert(HttpServletRequest request) throws Exception {  
		 
		PageData pdFile = new PageData();
		PageData pdAttachment = new PageData();
		
		ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
		uploadHandler.setHeaderEncoding("UTF-8");
		String root = request.getContextPath();
		JSONArray json = new JSONArray();
		JSONArray rjson = new JSONArray();
		
		String target_uid = request.getParameter("target_uid");
		String target_table = request.getParameter("target_table");
		String target_col = request.getParameter("target_col");
		String file_type = request.getParameter("file_type");
		//String create_user = request.getParameter("create_user"); 
		//String file_type_name = PropertyUtil.getProperty(file_type);

		 //将request变成多部分request

        MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request; 
       //获取multiRequest 中所有的文件名 
        Iterator iter=multiRequest.getFileNames(); 
        while(iter.hasNext()) 
        { 
            //一次遍历所有文件 
            MultipartFile file=multiRequest.getFile(iter.next().toString()); 
             
            if(file!=null) 
            { 
            	// 生成附件ID 
				// 文件保存路径：根路径/项目ID/附件ID
				String fileDir = commConfigVo.getFilePathDownload() + "/"+target_uid; 
				// 保存到系统的文件名，默认使用上传文件的名字
				String fileName = file.getOriginalFilename();
				 
				// 文件夹不存在的话，需要创建文件夹，否则直接写入文件
				File newFile = new File(fileDir);
				if (!newFile.exists() && !newFile.isDirectory()) {
					newFile.mkdirs();
					newFile = new File(fileDir);
					newFile.mkdir();
				}
				String newFileName = System.nanoTime()+"."+fileName.substring(fileName.lastIndexOf(".") + 1);
				newFile = new File(fileDir, newFileName); 
				file.transferTo(newFile);
				
				if(!"".equals(newFileName)){
					newFileName = newFileName.toLowerCase();
				}  
				JSONObject jsono = new JSONObject(); 
				pdAttachment.put("FILE_NAME", fileName);
				pdAttachment.put("FILE_EXT_NAME", fileName.substring(fileName.lastIndexOf(".") + 1));
				pdAttachment.put("FILE_PATH", "/"+target_uid+"/"+newFileName);
				pdAttachment.put("MIME_TYPE", this.getMimeType(newFile));
				pdAttachment.put("FILE_SIZE", String.valueOf(newFile.length())); 
				
				pdFile.put("TARGET_TABLE", target_table);
				pdFile.put("TARGET_UID", target_uid);
				pdFile.put("TARGET_COL", target_col);
				pdFile.put("FILE_TYPE", file_type);  
				String file_uid = insertTable(json,pdFile,pdAttachment);
				jsono.put("FILE_UID", file_uid);
				rjson.put(jsono);
            }  
        }
		return rjson;
	}
	
	
	/**
	 * 将VO信息存入数据库表
	 * 
	 * @param json
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private String insertTable(JSONArray json,PageData file,PageData attach) throws Exception { 
		Long file_uid = null;
		try { 
			 fileUploadDao.mb_save("TbAttachmentMapper.save", attach); 
			 file.put("ATTACHMENT_UID", attach.get("ATTACHMENT_UID"));
			fileUploadDao.mb_save("TbFileMapper.save", file); 
		} catch (Exception e) { 
			e.printStackTrace(System.out);
			throw e;
		} finally { 
		}
		return String.valueOf(file_uid);
	}
	
	
	

	/**
	 * 
	 * @param filename
	 * @return
	 */
	private String getSuffix(String filename) {
		String suffix = "";
		int pos = filename.lastIndexOf('.');
		if (pos > 0 && pos < filename.length() - 1) {
			suffix = filename.substring(pos + 1);
		}
		return suffix;
	}
 
}
