package com.jiuji.cn.business.tbsendmessage.vo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity 
@Table(name="tb_sendmessage",catalog="shop") 
public class TbSendMessage {
	
	private Integer F_Id ;
	
	private String FMobile = null;
	
	private String FCheckcode = null;
	
	private Date FTime = null;

	private String FIp = null;
	
    public TbSendMessage(){}
    
	public TbSendMessage(String mobile, String checkCode) {
		// TODO Auto-generated constructor stub
		this.FMobile = mobile;
		this.FCheckcode = checkCode;
	}

	
	
	
	@Id 
    @GeneratedValue
    @Column(name="F_Id", unique=true, nullable=false)
	public Integer getF_Id() {
		return F_Id;
	}

	public void setF_Id(Integer f_Id) {
		F_Id = f_Id;
	}

	@Column(name="F_Mobile") 
	public String getFMobile() {
		return FMobile;
	}

	public void setFMobile(String fMobile) {
		FMobile = fMobile;
	}

	@Column(name="F_Checkcode") 
	public String getFCheckcode() {
		return FCheckcode;
	}

	public void setFCheckcode(String FCheckcode) {
		this.FCheckcode = FCheckcode;
	}

	@Column(name="F_Time") 
	public Date getFTime() {
		return FTime;
	}

	public void setFTime(Date fTime) {
		FTime = fTime;
	}

   
	@Column(name="F_Ip") 	
	public String getFIp() {
		return FIp;
	}

	public void setFIp(String fIp) {
		FIp = fIp;
	} 
}
