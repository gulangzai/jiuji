package com.jiuji.cn.business.pictures.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lanbao.base.Page;
import com.lanbao.base.PageData;
import com.lanbao.mybatis.MyBatisBaseDao;




public interface TbPicturesService {

	PageData findById(PageData pd) throws Exception;

	void update(PageData picture) throws Exception;

	void edit(PageData pd) throws Exception;

	void delete(PageData pd) throws Exception;

	void save(PageData pd) throws Exception;

	List<PageData> getPicture(PageData pd) throws Exception;

	List<PageData> list(Page page) throws Exception;

	List<PageData> getAllById(String[] arrayDATA_IDS) throws Exception;

	List<PageData> listAll(PageData pd) throws Exception;

	void deleteAll(String[] arrayDATA_IDS) throws Exception;

	void delTp(PageData pd) throws Exception;

  
	
}

