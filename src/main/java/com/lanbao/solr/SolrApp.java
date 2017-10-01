package com.lanbao.solr;

import java.io.IOException;

import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;

import com.jiuji.cn.common.CommConfigVo;

/**
 * Hello world!
 *
 */
public class SolrApp 
{
	private static HttpSolrClient server = null;
	private static String url="http://121.42.185.68:8901/solr/core_master";
	
	public static HttpSolrClient getServer(){
		if(server==null){
			url = CommConfigVo.solrUrl;
			server = new HttpSolrClient(url);
			server.setDefaultMaxConnectionsPerHost(1000);
			server.setMaxTotalConnections(1000);
			server.setConnectionTimeout(60000);
			server.setSoTimeout(60000);
			server.setFollowRedirects(false);
			server.setAllowCompression(true);//允许压缩
		}
		return server;
	}
	

	
    public static void main( String[] args )throws Exception
    {
    	//SolrWordTest.deleteById("170");
    	SolrOperator.deleteByQuery("doc_uid:"+54); 
        System.out.println( "Hello World!" );
    }
}
