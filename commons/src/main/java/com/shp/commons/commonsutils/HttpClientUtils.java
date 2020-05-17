package com.shp.commons.commonsutils;

import org.apache.http.HttpEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;


/*
* HttpClient工具类
* @param params仅限于POST请求使用
* */
public class HttpClientUtils {
    public static final String GET="get";
    public static final String POST="post";
    public static final String REQUEST_CONNECION="keep-alive";
    public static final String REQUEST_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36";
    /*
    * GET请求
    * */
    public static String doGet(String url){
        return creatHttpClient(GET,url,null);
    }
    //带cookie的get请求
    public static String doGet(String url,String cookie){
        return creatHttpClient(GET,url,cookie);
    }
    /*
    * POST请求
    * */
    public static String doPost(String url,BasicNameValuePair... params){
        return creatHttpClient(POST,url,null,params);
    }
    //带cookie的post请求
    public static String doPost(String url,String cookie,BasicNameValuePair... params){
        return creatHttpClient(POST,url,cookie,params);
    }
    private static String creatHttpClient(String requestMethod, String url,String cookie,BasicNameValuePair... params){
        //创建httpclient客户端（打开浏览器）
        CloseableHttpClient httpClient = HttpClients.createDefault();
        String result= null;
        try {
            result = null;
            HttpGet httpGet = null;
            HttpPost httpPost = null;
            CloseableHttpResponse httpResponse = null;
            //GET请求
            if(GET.equals(requestMethod)){
                httpGet = new HttpGet(url);
                httpGet.setHeader("keep-alive",REQUEST_CONNECION);
                httpGet.setHeader("Cookie",cookie);
                httpGet.setHeader("User-Agent",REQUEST_AGENT);
                httpResponse = httpClient.execute(httpGet);
            }
            //POST请求
            else if(POST.equals(requestMethod)){
                httpPost = new HttpPost(url);
                httpPost.setHeader("keep-alive",REQUEST_CONNECION);
                httpPost.setHeader("User-Agent",REQUEST_AGENT);
                //传递参数
                if(params!=null&&params.length>0){
                    httpPost.setEntity(new UrlEncodedFormEntity(Arrays.asList(params),"UTF-8"));
                }
                httpResponse = httpClient.execute(httpPost);
            }
            HttpEntity httpEntity = httpResponse.getEntity();
            result=EntityUtils.toString(httpEntity);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (httpClient!=null){
                try {
                    httpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }
}
