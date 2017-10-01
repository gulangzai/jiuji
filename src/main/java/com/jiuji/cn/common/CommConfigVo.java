package com.jiuji.cn.common;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class CommConfigVo {
	
	public String url=null;
	
	@Value("#{commConfig.solrUrl}")  
	public static String solrUrl = null;
	
	@Value("#{commConfig.fileRoot}")  
	public   String fileRoot = null;
	
	
	@Value("#{commConfig.domain}")  
	public String domain = null;
	
	
	@Value("#{commConfig.filePathDownload}")  
	public   String filePathDownload;

	
	/*public CommConfigVo(){
		InputStream in;
		try {
			ClassLoader classLoader = getClass().getClassLoader();
			URL url = classLoader.getResource("CommConfig.properties");
			String urlName = url.getFile();
			in = new BufferedInputStream(new FileInputStream(urlName));
			 Properties p = new Properties();  
			 p.load(in); 
			 setFilePathDownload(p.getProperty("filePathDownload"));  
		} catch (FileNotFoundException e) { 
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}   
	}*/
	
	@Value("#{commConfig}")
	public void setCommConfig(Properties commConfig){
		filePathDownload = commConfig.getProperty("filePathDownload");
	}

	public String getFilePathDownload() {
		return filePathDownload;
	}

	@Value("#{commConfig.filePathDownload}")
	public void setFilePathDownload(String filePathDownload) {
		this.filePathDownload = filePathDownload;
	}

	public String getDomain() {
		return domain;
	}
	
	@Value("#{commConfig.domain}")
	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getFileRoot() {
		return fileRoot;
	}
	
	@Value("#{commConfig.fileRoot}")
	public void setFileRoot(String fileRoot) {
		this.fileRoot = fileRoot;
	}

	public String getSolrUrl() {
		return solrUrl;
	}

	@Value("#{commConfig.solrUrl}")
	public void setSolrUrl(String solrUrl) {
		this.solrUrl = solrUrl;
	} 
	 
	 
}
