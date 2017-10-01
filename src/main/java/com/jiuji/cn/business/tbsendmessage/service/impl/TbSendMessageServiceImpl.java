package com.jiuji.cn.business.tbsendmessage.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jiuji.cn.business.tbsendmessage.dao.TbSendMessageDao;
import com.jiuji.cn.business.tbsendmessage.service.TbSendMessageService;
import com.jiuji.cn.business.tbsendmessage.vo.TbSendMessage;

@Service
public class TbSendMessageServiceImpl implements TbSendMessageService{

	@Autowired
	TbSendMessageDao tbSendMessageDao;
	
	@Override
	public void update(TbSendMessage tbsendMessage) {
		// TODO Auto-generated method stub
		tbSendMessageDao.h_update(tbsendMessage); 
	}

}
