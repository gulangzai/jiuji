package com.lanbao.ckFinder;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.ckfinder.connector.configuration.Configuration;
import com.lanbao.entity.TbUser;
import com.lanbao.utils.Const;

public class CKFinderConfiguration extends Configuration {
    public CKFinderConfiguration(ServletConfig servletConfig) {
        super(servletConfig);
    }
    @Override
    protected Configuration createConfigurationInstance() {
        return new CKFinderConfiguration(this.servletConf);
    }
    @Override
    public boolean checkAuthentication(final HttpServletRequest request){
    	TbUser user = (TbUser) request.getSession().getAttribute(Const.SESSION_USER);
        boolean logined = user!=null;
        return logined;
    }
}
