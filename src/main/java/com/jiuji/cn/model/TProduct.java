package com.jiuji.cn.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TProduct generated by hbm2java
 */
@Entity
@Table(name = "t_product", catalog = "shop")
public class TProduct implements java.io.Serializable {

	private Integer FClsId;
	private String FProductId;
	private String FProductName;
	private String FProductPic;
	private String FProductDesc;
	private Integer FPrice; 
	private Date FProductTime;
	private Integer FStatus;
	private Integer FIsSpecial;
	private Integer FDegree;
	private String FPath;
	
	public TProduct() {
	}

	public TProduct(String FProductId) {
		this.FProductId = FProductId;
	}

	public TProduct(String FProductId, TClass TClass, String FProductName, String FProductDesc, Integer FPrice) {
		this.FProductId = FProductId; 
		this.FProductName = FProductName;
		this.FProductDesc = FProductDesc;
		this.FPrice = FPrice;
	}

	@Id

	@Column(name = "F_ProductId", unique = true, nullable = false, length = 44)
	public String getFProductId() {
		return this.FProductId;
	}

	public void setFProductId(String FProductId) {
		this.FProductId = FProductId;
	}

	
	@Column(name = "F_ProductName", length = 44)
	public String getFProductName() {
		return this.FProductName;
	}

	public void setFProductName(String FProductName) {
		this.FProductName = FProductName;
	}

	@Column(name = "F_ProductDesc", length = 200)
	public String getFProductDesc() {
		return this.FProductDesc;
	}

	public void setFProductDesc(String FProductDesc) {
		this.FProductDesc = FProductDesc;
	}

	@Column(name = "F_Price")
	public Integer getFPrice() {
		return this.FPrice;
	}

	public void setFPrice(Integer FPrice) {
		this.FPrice = FPrice;
	}

	public String getFProductPic() {
		return FProductPic;
	}

	public void setFProductPic(String fProductPic) {
		FProductPic = fProductPic;
	}

	public Integer getFClsId() {
		return FClsId;
	}

	public void setFClsId(Integer fClsId) {
		FClsId = fClsId;
	}

	public Date getFProductTime() {
		return FProductTime;
	}

	public void setFProductTime(Date fProductTime) {
		FProductTime = fProductTime;
	}

	public Integer getFStatus() {
		return FStatus;
	}

	public void setFStatus(Integer fStatus) {
		FStatus = fStatus;
	}

	public Integer getFIsSpecial() {
		return FIsSpecial;
	}

	public void setFIsSpecial(Integer fIsSpecial) {
		FIsSpecial = fIsSpecial;
	}

	public Integer getFDegree() {
		return FDegree;
	}

	public void setFDegree(Integer fDegree) {
		FDegree = fDegree;
	}

	public String getFPath() {
		return FPath;
	}

	public void setFPath(String fPath) {
		FPath = fPath;
	}

    
   
	
	
}
