package com.jiuji.cn.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface HomePageService {

	void queryInfomation(Model model, HttpSession session,HttpServletRequest req);

	void queryClassInfomation(Model model, HttpSession session);

}
