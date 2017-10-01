package com.jiuji.cn.business.tbshouchang.vo;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_shouchang",catalog="shop") 
public class TbShouChang {
	
	private Integer FShouchangUid;     
    
	private Long FProductId;    
	
	private String FSku;
	 
	private String FUserId;
	
	private Date FCreateDate;
	
    @Id 
    @GeneratedValue
    @Column(name="F_SHOUCHANG_UID", unique=true, nullable=false)
    public Integer getFShouchangUid() {
		return FShouchangUid;
	}

	public void setFShouchangUid(Integer fShouchangUid) {
		FShouchangUid = fShouchangUid;
	}

	@Column(name="F_PRODUCT_ID", length=200) 
	public Long getFProductId() {
		return FProductId;
	}

	public void setFProductId(Long fProductId) {
		FProductId = fProductId;
	}

	@Column(name="F_SKU", length=200)
	public String getFSku() {
		return FSku;
	}

	public void setFSku(String fSku) {
		FSku = fSku;
	}

	@Column(name="F_USER_ID", length=200)
	public String getFUserId() {
		return FUserId;
	}

	public void setFUserId(String fUserId) {
		FUserId = fUserId;
	}

	@Column(name="F_CREATE_DATE")
	public Date getFCreateDate() {
		return FCreateDate;
	}

	public void setFCreateDate(Date fCreateDate) {
		FCreateDate = fCreateDate;
	}
	
	
}
