package com.jiuji.cn.business.tbnotice.dao;

import java.util.List;

import com.jiuji.cn.business.tbnotice.vo.TbNotice;
import com.lanbao.dao.BaseDao;

public interface TbNoticeDao extends BaseDao{

	public List<TbNotice> findNewNotice();

}