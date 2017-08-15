package com.jiuji.cn.business.tbstandard.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TProduct generated by hbm2java
 */
@Entity 
@Table(name="tb_standard") 
public class TbStandard implements java.io.Serializable {

   
   public Integer f_standard_id;
   
   public Integer f_productId;
   
   public String f_standardName;
   
   public String f_standardValue;
   
   public Integer f_xuhao;
     
	
	public TbStandard(Integer f_productId) {
		this.f_productId = f_productId;
	}
	
	public TbStandard(Integer f_standard_id,Integer f_productId,String f_standardName,String f_standardValue) {
		this.f_standard_id = f_standard_id;
		this.f_productId = f_productId;
		this.f_standardName = f_standardName;
		this.f_standardValue = f_standardValue; 
	}

	@Id
	@GeneratedValue
	@Column(name="F_STANDARD_ID")
	public Integer getF_standard_id() {
		return f_standard_id;
	}

	public void setF_standard_id(Integer f_standard_id) {
		this.f_standard_id = f_standard_id;
	}

	public Integer getF_productId() {
		return f_productId;
	}

	public void setF_productId(Integer f_productId) {
		this.f_productId = f_productId;
	}

	public String getF_standardName() {
		return f_standardName;
	}

	public void setF_standardName(String f_standardName) {
		this.f_standardName = f_standardName;
	}

	public String getF_standardValue() {
		return f_standardValue;
	}

	public void setF_standardValue(String f_standardValue) {
		this.f_standardValue = f_standardValue;
	}

	public Integer getF_xuhao() {
		return f_xuhao;
	}

	public void setF_xuhao(Integer f_xuhao) {
		this.f_xuhao = f_xuhao;
	} 
	
	
}
