package com.jiuji.cn.business.tbnotice.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.hibernate.SQLQuery;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.lanbao.dao.BaseDao;
import com.lanbao.dao.impl.BaseDaoImpl;
import com.lanbao.mybatis.impl.MyBatisBaseDaoImpl;
import com.jiuji.cn.business.tbnotice.dao.TbNoticeDao;
import com.jiuji.cn.business.tbnotice.vo.TbNotice;
import com.jiuji.cn.business.tbproduct.modal.TbProduct; 

@Component
public class TbNoticeDaoImpl extends BaseDaoImpl implements TbNoticeDao{

	@Override
	public List<TbNotice> findNewNotice() {
		HashMap map = new HashMap();  
		String sqlQueryString = "select  tn.*,"
				+" (case when tn.F_NOTICE_TYPE='XTXX' then '系统消息' when  tn.F_NOTICE_TYPE='QTGG' then '其他公告' when tn.F_NOTICE_TYPE='HYGG' then '会员公告' when tn.F_NOTICE_TYPE='PTGG' then '平台公告'  end) AS  F_NOTICE_TYPE_LABEL "
				+" from tb_notice tn where tn.F_STATUS = '1' AND tn.F_NOTICE_TYPE!='XTXX'  ORDER BY tn.F_CREATE_DATE DESC limit 0,7";
		SQLQuery sqlQuery = this.h_createSQLQuery(sqlQueryString, map); 
		return sqlQuery.addEntity(TbNotice.class).list(); 
	
	}

}
