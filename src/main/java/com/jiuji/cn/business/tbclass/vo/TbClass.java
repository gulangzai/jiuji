package com.jiuji.cn.business.tbclass.vo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.jiuji.cn.business.tbproduct.modal.TbProduct;
import com.lanbao.base.PageData;

@Entity
@Table(name="tb_class",catalog="shop") 
public class TbClass {
	
	public List<PageData> products = new ArrayList();

	public Integer FClsId;
	
	public String FClsName;
	
	public TbClass(){ 
	}
	
	public TbClass(Integer FClsId){
		this.FClsId = FClsId;
	}
	
    public TbClass(int i, String FClsName) {
		// TODO Auto-generated constructor stub
    	this(i);
    	this.FClsName = FClsName;
	}

	@Id 
    @GeneratedValue
    @Column(name="F_ClsId", unique=true, nullable=false)
	public Integer getFClsId() {
		return FClsId;
	}

	public void setFClsId(Integer fClsId) {
		FClsId = fClsId;
	}
	
    @Column(name="F_ClsName", length=200) 
	public String getFClsName() {
		return FClsName;
	}

	public void setFClsName(String fClsName) {
		FClsName = fClsName;
	}

	@OneToMany(targetEntity=TbProduct.class,orphanRemoval=true)  
	@JoinColumn(name="F_ClsId") 
	public List<PageData> getProducts() {
		return products;
	}

	public void setProducts(List<PageData> products) {
		this.products = products;
	}
	
	
}
