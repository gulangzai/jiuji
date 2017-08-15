package com.jiuji.cn.business.tbyouhui.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_youhui_user")
public class TbYouhuiUser {
	
	public String   fYouhuiUserUid;
	
	public String   fYouHui;
	
	public String   fUserUid;
	
	public String   fYouhuiCode;
	
	public Integer   fIsUsed;

	@Id
	@GeneratedValue
	@Column(name="F_YOUHUI_USER_UID")
	public String getfYouhuiUserUid() {
		return fYouhuiUserUid;
	}

	public void setfYouhuiUserUid(String fYouhuiUserUid) {
		this.fYouhuiUserUid = fYouhuiUserUid;
	}

	@Column(name="F_YOUHUI_UID", nullable=true)
	public String getfYouHui() {
		return fYouHui;
	}

	public void setfYouHui(String fYouHui) {
		this.fYouHui = fYouHui;
	}

	@Column(name="F_USER_UID", nullable=true)
	public String getfUserUid() {
		return fUserUid;
	}

	public void setfUserUid(String fUserUid) {
		this.fUserUid = fUserUid;
	}


	@Column(name="F_YOUHUI_CODE", nullable=true)
	public String getfYouhuiCode() {
		return fYouhuiCode;
	}

	public void setfYouhuiCode(String fYouhuiCode) {
		this.fYouhuiCode = fYouhuiCode;
	}
	
	@Column(name="F_IS_USED", nullable=true)
	public Integer getfIsUsed() {
		return fIsUsed;
	}
	
	public void setfIsUsed(Integer fIsUsed) {
		this.fIsUsed = fIsUsed;
	} 
	
}
