package com.jiuji.cn.business.tbyouhui.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TbYouhui entity. @author MyEclipse Persistence Tools
 */

@Entity
@Table(name="tb_youhui")
public class TbYouhui implements java.io.Serializable {

	// Fields

	private Integer FYouhuiUid;
	private String FYouhuiName;
	private String FYouhuiCode;
	private String FYouhuiType;
	private Integer FXuhao;
	private Integer FMoney;

	// Constructors

	/** default constructor */
	public TbYouhui() {
	}

	/** full constructor */
	public TbYouhui(String FYouhuiName, String FYouhuiCode, String FYouhuiType,
			Integer FXuhao, Integer FMoney) {
		this.FYouhuiName = FYouhuiName;
		this.FYouhuiCode = FYouhuiCode;
		this.FYouhuiType = FYouhuiType;
		this.FXuhao = FXuhao;
		this.FMoney = FMoney;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name="F_YOUHUI_UID")
	public Integer getFYouhuiUid() {
		return this.FYouhuiUid;
	}

	public void setFYouhuiUid(Integer FYouhuiUid) {
		this.FYouhuiUid = FYouhuiUid;
	}

	public String getFYouhuiName() {
		return this.FYouhuiName;
	}

	public void setFYouhuiName(String FYouhuiName) {
		this.FYouhuiName = FYouhuiName;
	}

	public String getFYouhuiCode() {
		return this.FYouhuiCode;
	}

	public void setFYouhuiCode(String FYouhuiCode) {
		this.FYouhuiCode = FYouhuiCode;
	}

	public String getFYouhuiType() {
		return this.FYouhuiType;
	}

	public void setFYouhuiType(String FYouhuiType) {
		this.FYouhuiType = FYouhuiType;
	}

	public Integer getFXuhao() {
		return this.FXuhao;
	}

	public void setFXuhao(Integer FXuhao) {
		this.FXuhao = FXuhao;
	}

	public Integer getFMoney() {
		return this.FMoney;
	}

	public void setFMoney(Integer FMoney) {
		this.FMoney = FMoney;
	}

}