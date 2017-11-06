package com.lanbao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Enumeration;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import freemarker.template.SimpleHash;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import jodd.props.PropsUtil;

public class MyFreeMarkerView extends FreeMarkerView{
 
    @Override
    protected void doRender(Map model,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        exposeModelAsRequestAttributes(model, request);
        SimpleHash fmModel = buildTemplateModel(model, request, response);
 
        Locale locale = RequestContextUtils.getLocale(request);
        
        /*
         * 默认不生成静态文件,除非在Action中进行如下设置 
         * model.addAttribute("STATIC_PAGE", true);
         */
        if(model.get("STATIC_PAGE") == null || Boolean.FALSE.equals(model.get("STATIC_PAGE"))){
            processTemplate(getTemplate(locale), fmModel, response);
        }else{
            createHTML(getTemplate(locale), fmModel, request, response);
        }
    }

    public void createHTML(Template template, SimpleHash model,HttpServletRequest request,
            HttpServletResponse response) throws IOException, TemplateException, ServletException {
        // 静态文件根目录的绝对路径
        ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(request
                .getSession().getServletContext());
        PropsUtil configHelper = (PropsUtil) context.getBean("configHelper");
        //String basePath = configHelper.getProperty("static_html_path");
         String basePath = "D:\\Program Files\\Apache Software Foundation\\Tomcat 7.0\\webapps\\ROOT\\static\\";
        // 访问的URL(根目录以后,如xxx/113.html)
        String requestHTML = this.getRequestHTML(request);
        // 静态页面保存的绝对路径
        String htmlPath = basePath + requestHTML;
        // response路径
        String responsePath = "/" + requestHTML;
        File htmlFile = new File(htmlPath);
        if (!htmlFile.getParentFile().exists()) {
            htmlFile.getParentFile().mkdirs();
        }
        if (!htmlFile.exists()) {
            htmlFile.createNewFile();
        }
        Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile),
                "UTF-8"));
        // 处理模版
        template.process(model, out);
        out.flush();
        out.close();

        request.getRequestDispatcher(responsePath).forward(request, response);
    }
    
    /**
     * 获取要生成的静态文件相对路径
     * 
     * @param request HttpServletRequest
     * @return /目录/*.html
     */
    private String getRequestHTML(HttpServletRequest request) {
        // web应用名称,部署在ROOT目录时为空
        String contextPath = request.getContextPath();
        // web应用/目录/文件,如/xxxx/1
        String requestURI = request.getRequestURI();
        // basePath里面已经有了web应用名称，所以直接把它replace掉，以免重复
        requestURI = requestURI.replaceFirst(contextPath, "");

        // 得到参数
        Enumeration<?> pNames = request.getParameterNames();
        while (pNames.hasMoreElements()) {
            String name = (String) pNames.nextElement();
            String value = request.getParameter(name);
            requestURI = requestURI + "_" + name + "=" + value;
        }

        // 加上.html后缀
        requestURI = requestURI + ".html";

        return requestURI;
    }
   
 
}