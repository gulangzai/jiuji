package com.jiuji.cn.business.print;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lanbao.base.PageData;
import com.lanbao.controller.BaseController;

@Controller
@RequestMapping(value="/tbPrintController")
public class TbPrintController  extends BaseController{

 
	@RequestMapping(value="/toPrint")
	public ModelAndView toPrint(){ 
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			mv.setViewName("/modules/print/print"); 
		} catch (Exception e) {
			logger.error(e.toString(), e);
		}						
		return mv;
	}
	
}
