package com.jiuji.cn.model;
 

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TLoginLog generated by hbm2java
 */
@Entity
@Table(name = "t_login_log", catalog = "shop")
public class TLoginLog implements java.io.Serializable {

	private String userId;
	private Date loginTime;
	private Date loginOut;

	public TLoginLog() {
	}

	public TLoginLog(String userId) {
		this.userId = userId;
	}

	public TLoginLog(String userId, Date loginTime, Date loginOut) {
		this.userId = userId;
		this.loginTime = loginTime;
		this.loginOut = loginOut;
	}

	@Id

	@Column(name = "userId", unique = true, nullable = false, length = 11)
	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "loginTime", length = 19)
	public Date getLoginTime() {
		return this.loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "loginOut", length = 19)
	public Date getLoginOut() {
		return this.loginOut;
	}

	public void setLoginOut(Date loginOut) {
		this.loginOut = loginOut;
	}

}
