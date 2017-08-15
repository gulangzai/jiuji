package com.jiuji.cn.business.tbhot.vo;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="tb_hot")
public class TbHot {
	
           
	int F_NEW_UID;
	
	String F_SKU;
	
	int  F_PRODUCT_ID;
	
	int F_STATUS;
	
	Date F_CREATE_DATE = null;
	
	String F_CREATE_USER = null;
	
	int F_POWER = 0;

	@Id
	@GeneratedValue
	@Column(name="F_NEW_UID")
	public int getF_NEW_UID() {
		return F_NEW_UID;
	}

	public void setF_NEW_UID(int f_NEW_UID) {
		F_NEW_UID = f_NEW_UID;
	}

	public String getF_SKU() {
		return F_SKU;
	}

	public void setF_SKU(String f_SKU) {
		F_SKU = f_SKU;
	}

	public int getF_PRODUCT_ID() {
		return F_PRODUCT_ID;
	}

	public void setF_PRODUCT_ID(int f_PRODUCT_ID) {
		F_PRODUCT_ID = f_PRODUCT_ID;
	}

	public int getF_STATUS() {
		return F_STATUS;
	}

	public void setF_STATUS(int f_STATUS) {
		F_STATUS = f_STATUS;
	}

	public Date getF_CREATE_DATE() {
		return F_CREATE_DATE;
	}

	public void setF_CREATE_DATE(Date f_CREATE_DATE) {
		F_CREATE_DATE = f_CREATE_DATE;
	}

	public String getF_CREATE_USER() {
		return F_CREATE_USER;
	}

	public void setF_CREATE_USER(String f_CREATE_USER) {
		F_CREATE_USER = f_CREATE_USER;
	}

	public int getF_POWER() {
		return F_POWER;
	}

	public void setF_POWER(int f_POWER) {
		F_POWER = f_POWER;
	} 
}
