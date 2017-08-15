package com.jiuji.cn.business;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.cookie.Cookie;
import org.apache.http.impl.client.AbstractHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;  
  

public class Login{

    private String zjh;
    private String mm;
    private String webPage;
    private String [][] kebiao = new String[15][8]; 
    
    static String url = "https://login.maijia.com/user/login?redirectURL=http%3A%2F%2Fwww.maijia.com%2Fwish%2Fdata.html%23%2Findex%2F";
    static String getUrl = "http://www.maijia.com/wish/data.html#/index/";
    
    public Login() { 
    }
    
    
    public static void main(String[] args) {
    	Login login = new Login();
    	login.doInBackground(url,getUrl);
	}
    
    protected String[][] doInBackground(String url,String getUrl) {
        List<NameValuePair> list = new ArrayList<NameValuePair>();
        list.add(new BasicNameValuePair("loginCode", "15021274597"));
        list.add(new BasicNameValuePair("loginPassword", "wazll1314"));//表单信息
        String encode = "gb2312";//编码格式，从F12工具中可以找到
        HttpClient httpClient = new DefaultHttpClient();
        List<Cookie> cookies;
        try {
            HttpEntity entity = new UrlEncodedFormEntity(list ,encode);//封装数据
            HttpPost post = new HttpPost(url);//建立POST请求
            post.setEntity(entity);
            HttpResponse httpResponse = httpClient.execute(post);
            String data, result;
            if (httpResponse.getStatusLine().getStatusCode() == 200) {//登录成功
                cookies = ((AbstractHttpClient) httpClient).getCookieStore().getCookies();//获取Cookie
                HttpGet httpGet = new HttpGet(getUrl);
               /* httpGet.setHeader("Cookie", "JSESSIONID="+ cookies.get(0).getValue()+";"+
                        "NSC_kjbpxv-iuuq="+cookies.get(1).getValue()); */
                httpGet.setHeader("Cookie", "_qddaz="+ cookies.get(0).getValue()+";"+
                        "Hm_lvt_8c619410770b1c3446a04be9cfb938f7="+cookies.get(1).getValue()+";"+"Hm_lpvt_8c619410770b1c3446a04be9cfb938f7="+cookies.get(2).getValue()+";auth=");
                httpResponse = new DefaultHttpClient().execute(httpGet);
                
                StringBuffer sb = new StringBuffer();
                entity = httpResponse.getEntity();
                InputStream inputStream = entity.getContent();
                BufferedReader br = new BufferedReader(new InputStreamReader(inputStream, encode));
                while ((data = br.readLine()) != null) {  
                    sb.append(data);  //读取返回的网页
                }  
                result = sb.toString();
                webPage = result;
        
            } else {
                return null;
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        } 
        return null;
    }
   
}
