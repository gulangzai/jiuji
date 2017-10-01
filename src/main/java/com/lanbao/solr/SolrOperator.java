package com.lanbao.solr;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.request.AbstractUpdateRequest;
import org.apache.solr.client.solrj.request.ContentStreamUpdateRequest;
import org.apache.solr.client.solrj.response.Group;
import org.apache.solr.client.solrj.response.GroupCommand;
import org.apache.solr.client.solrj.response.GroupResponse;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.GroupParams;

import com.jiuji.cn.business.tbclass.dao.TbClassDao;
import com.jiuji.cn.business.tbclass.vo.TbClass;

public class SolrOperator {
	
	
	public static void main(String[] args) throws Exception {
	     //create("D:/Attached/FileLoadRoot");
	    //create("D:/Attached/FileLoadRoot/folderDownload/443904542A1D2E8C1BD8966196E6AC37/10e34901f5c94e0caa9feef7f91f96f9");
		//delete();
	    query();
	}
	public static void create(String fileDir)throws Exception{
		HttpSolrClient server = SolrApp.getServer();
		ContentStreamUpdateRequest up = new ContentStreamUpdateRequest("/update/extract");
		recursion(server,up,new File(fileDir)); 
		server.commit();
	}
	
	public static void delete() throws SolrServerException, IOException{
		HttpSolrClient server = SolrApp.getServer();
		server.deleteByQuery("*");        
		server.commit();  
	    System.out.println("Documents deleted"); 
	}
	
	public static void deleteById(String id) throws SolrServerException, IOException{
		HttpSolrClient server = SolrApp.getServer();
		server.deleteById(id);
		server.commit();  
	    System.out.println(id+"Documents deleted"); 
	}
	
	public static void deleteByQuery(String deleteQuery) throws SolrServerException, IOException{
		HttpSolrClient server = SolrApp.getServer(); 
		server.deleteByQuery(deleteQuery);
		server.commit();  
	    System.out.println(deleteQuery+"Documents deleted"); 
	}
	
	
	static int index = 1 ;
	public static void recursion(HttpSolrClient server,ContentStreamUpdateRequest up,File file) throws IOException, SolrServerException{
		if(file.isDirectory()){ 
		    for(File singleFile : file.listFiles()){ 
			    recursion(server,up,singleFile);
		    }
		}else{ 
			if(isUpdateFormat(file.getName())){
				up.addFile(file, "application/word");
				up.setParam("literal.id",String.valueOf(index)); 
				up.setParam("literal.file_uid",String.valueOf(index)); 
				up.setParam("literal.file_name", file.getName());
				up.setParam("literal.file_path", file.getAbsolutePath());
				
				up.setParam("literal.doc_uid",String.valueOf(index)); 
				up.setParam("literal.doc_title", String.valueOf("我是知识标题"+index));
				
				
				up.setParam("literal.name",file.getName());
				up.setParam("fmap.content", "attr_content");
				up.setParam("fmap.content_type", "documentFormat");  
				up.setAction(AbstractUpdateRequest.ACTION.COMMIT, true, true);
				server.request(up);
				index++;
			}
			
		} 
	}
	
	public static boolean isUpdateFormat(String fileName){
	   boolean flag = false;
	   String[] fileNames = fileName.split("\\.");
	   if(fileNames.length>1){
		   if("docx".equals(fileNames[1])){
			   flag = true; 
		   }
	   }
	   return flag;
	}
	public static void query() throws Exception {
		HttpSolrClient server = SolrApp.getServer();
		// 定义查询内容 * 代表查询所有 这个是基于结果集
		SolrQuery query = new SolrQuery("doc_uid:56"); // 定义查询内容
		query.setStart(0);// 起始页
		query.setRows(20);// 每页显示数量
		QueryResponse rsp = server.query(query);
		SolrDocumentList results = rsp.getResults();
		System.out.println(results.getNumFound());// 查询总条数
		for (SolrDocument doc : results) {
			System.out.println(doc.get("name"));
		}
	}
	
	public static List groupQuery(String queryField,String value,TbClassDao tbClassDao)throws Exception{
		value = "".equals(value)?"*":value;
		List resultList = new ArrayList(); 
		HttpSolrClient server = SolrApp.getServer(); 
	    SolrQuery query = new SolrQuery(queryField+":"+value);
	    query.setParam(GroupParams.GROUP, true);
	    query.setParam(GroupParams.GROUP_FIELD, "F_ClsId_i");
	    query.setParam(GroupParams.GROUP_LIMIT, "1");
	    //query.setRows(10);
	    QueryResponse response = server.query(query);
	    if(response!=null){
	    	GroupResponse groupResponse = response.getGroupResponse();
	    	if(groupResponse!=null){
	    		List<GroupCommand> groupList = groupResponse.getValues();
	    		for (GroupCommand groupCommand : groupList) {
					List<Group> groups = groupCommand.getValues();
					
					for (Group group : groups) { 
						SolrDocumentList docList = group.getResult();
						SolrDocument doc =  docList.get(0); 
						Map<String, String> map = new HashMap();
						map.put("count", String.valueOf(docList.getNumFound()));
						TbClass tbClass = (TbClass) tbClassDao.get(TbClass.class, (Serializable) doc.getFieldValue("F_ClsId_i"));
						map.put("F_ClsName",tbClass.getFClsName()); 
						map.put("F_ProductName", String.valueOf(doc.getFieldValue("F_ProductName_tk")));
						map.put("F_ClsId", String.valueOf(doc.getFieldValue("F_ClsId_i"))); 
						resultList.add(map);
					}
				}
	    	}
	    }
	    return resultList;
	}
	
}
