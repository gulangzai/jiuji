package com.jiuji.cn.business.tbproduct.modal;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue; 
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * TbProduct entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="tb_product",catalog="shop") 
public class TbProduct  implements java.io.Serializable {


    // Fields    

     private Long FProductId; 
     private String FParentSku;
     private String FSku;
     private Integer FMain;
     private String FProductName;
     private String FProductDesc;
     private Double FShowPrice;
     private Double FPrice;
     private Double FRealPrice;
     private Integer FNumber;
     private Integer FIsSpecial;
     private Double FExpress;
     private Timestamp FProductTime;
     private Integer FStatus;
     private Integer FDegree;
     private String FPath;
     private String FPath1;
     private String FPath2;
     private String FPath3;
     private String FPath4;
     private String FPath5;
     private String FPath6;
     private String FPath7;
     private String FPath8;
     private String FBrand;
     private String FColor;
     private String FSize;
     private String FLabel;
     private Integer FSaleNum;
     private String FWishItem;


    // Constructors

    /** default constructor */
    public TbProduct() {
    }

	/** minimal constructor */
    public TbProduct(Double FShowPrice, Double FPrice, Double FRealPrice) {
        this.FShowPrice = FShowPrice;
        this.FPrice = FPrice;
        this.FRealPrice = FRealPrice;
    }
    
    /** full constructor */
    public TbProduct(String FParentSku, String FSku, Integer FMain, String FProductName, String FProductDesc, Double FShowPrice, Double FPrice, Double FRealPrice, Integer FNumber, Integer FIsSpecial, Double FExpress, Timestamp FProductTime, Integer FStatus, Integer FDegree, String FPath, String FPath1, String FPath2, String FPath3, String FPath4, String FPath5, String FPath6, String FPath7, String FPath8, String FBrand, String FColor, String FSize, String FLabel, Integer FSaleNum, String FWishItem) {
        this.FParentSku = FParentSku;
        this.FSku = FSku;
        this.FMain = FMain;
        this.FProductName = FProductName;
        this.FProductDesc = FProductDesc;
        this.FShowPrice = FShowPrice;
        this.FPrice = FPrice;
        this.FRealPrice = FRealPrice;
        this.FNumber = FNumber;
        this.FIsSpecial = FIsSpecial;
        this.FExpress = FExpress;
        this.FProductTime = FProductTime;
        this.FStatus = FStatus;
        this.FDegree = FDegree;
        this.FPath = FPath;
        this.FPath1 = FPath1;
        this.FPath2 = FPath2;
        this.FPath3 = FPath3;
        this.FPath4 = FPath4;
        this.FPath5 = FPath5;
        this.FPath6 = FPath6;
        this.FPath7 = FPath7;
        this.FPath8 = FPath8;
        this.FBrand = FBrand;
        this.FColor = FColor;
        this.FSize = FSize;
        this.FLabel = FLabel;
        this.FSaleNum = FSaleNum;
        this.FWishItem = FWishItem;
    }

   
    // Property accessors
    @Id 
    @GeneratedValue
    @Column(name="F_PRODUCT_ID", unique=true, nullable=false)

    public Long getFProductId() {
        return this.FProductId;
    }
    
    public void setFProductId(Long FProductId) {
        this.FProductId = FProductId;
    }
 
    
    @Column(name="F_PARENT_SKU", length=200) 
    public String getFParentSku() {
        return this.FParentSku;
    }
    
    public void setFParentSku(String FParentSku) {
        this.FParentSku = FParentSku;
    }
    
    @Column(name="F_SKU")

    public String getFSku() {
        return this.FSku;
    }
    
    public void setFSku(String FSku) {
        this.FSku = FSku;
    }
    
    @Column(name="F_MAIN")

    public Integer getFMain() {
        return this.FMain;
    }
    
    public void setFMain(Integer FMain) {
        this.FMain = FMain;
    }
    
    @Column(name="F_ProductName", length=2200)

    public String getFProductName() {
        return this.FProductName;
    }
    
    public void setFProductName(String FProductName) {
        this.FProductName = FProductName;
    }
    
    @Column(name="F_ProductDesc", length=5000)

    public String getFProductDesc() {
        return this.FProductDesc;
    }
    
    public void setFProductDesc(String FProductDesc) {
        this.FProductDesc = FProductDesc;
    }
    
    @Column(name="F_SHOW_PRICE", nullable=false, precision=11)

    public Double getFShowPrice() {
        return this.FShowPrice;
    }
    
    public void setFShowPrice(Double FShowPrice) {
        this.FShowPrice = FShowPrice;
    }
    
    @Column(name="F_Price", nullable=false, precision=11)

    public Double getFPrice() {
        return this.FPrice;
    }
    
    public void setFPrice(Double FPrice) {
        this.FPrice = FPrice;
    }
    
    @Column(name="F_REAL_PRICE", nullable=false, precision=11)

    public Double getFRealPrice() {
        return this.FRealPrice;
    }
    
    public void setFRealPrice(Double FRealPrice) {
        this.FRealPrice = FRealPrice;
    }
    
    @Column(name="F_Number")

    public Integer getFNumber() {
        return this.FNumber;
    }
    
    public void setFNumber(Integer FNumber) {
        this.FNumber = FNumber;
    }
    
    @Column(name="F_IsSpecial")

    public Integer getFIsSpecial() {
        return this.FIsSpecial;
    }
    
    public void setFIsSpecial(Integer FIsSpecial) {
        this.FIsSpecial = FIsSpecial;
    }
    
    @Column(name="F_Express", precision=11)

    public Double getFExpress() {
        return this.FExpress;
    }
    
    public void setFExpress(Double FExpress) {
        this.FExpress = FExpress;
    }
    
    @Column(name="F_ProductTime", length=19)

    public Timestamp getFProductTime() {
        return this.FProductTime;
    }
    
    public void setFProductTime(Timestamp FProductTime) {
        this.FProductTime = FProductTime;
    }
    
    @Column(name="F_Status")

    public Integer getFStatus() {
        return this.FStatus;
    }
    
    public void setFStatus(Integer FStatus) {
        this.FStatus = FStatus;
    }
    
    @Column(name="F_Degree")

    public Integer getFDegree() {
        return this.FDegree;
    }
    
    public void setFDegree(Integer FDegree) {
        this.FDegree = FDegree;
    }
    
    @Column(name="F_PATH")

    public String getFPath() {
        return this.FPath;
    }
    
    public void setFPath(String FPath) {
        this.FPath = FPath;
    }
    
    @Column(name="F_PATH1", length=200)

    public String getFPath1() {
        return this.FPath1;
    }
    
    public void setFPath1(String FPath1) {
        this.FPath1 = FPath1;
    }
    
    @Column(name="F_PATH2", length=200)

    public String getFPath2() {
        return this.FPath2;
    }
    
    public void setFPath2(String FPath2) {
        this.FPath2 = FPath2;
    }
    
    @Column(name="F_PATH3", length=200)

    public String getFPath3() {
        return this.FPath3;
    }
    
    public void setFPath3(String FPath3) {
        this.FPath3 = FPath3;
    }
    
    @Column(name="F_PATH4", length=200)

    public String getFPath4() {
        return this.FPath4;
    }
    
    public void setFPath4(String FPath4) {
        this.FPath4 = FPath4;
    }
    
    @Column(name="F_PATH5", length=200)

    public String getFPath5() {
        return this.FPath5;
    }
    
    public void setFPath5(String FPath5) {
        this.FPath5 = FPath5;
    }
    
    @Column(name="F_PATH6", length=200)

    public String getFPath6() {
        return this.FPath6;
    }
    
    public void setFPath6(String FPath6) {
        this.FPath6 = FPath6;
    }
    
    @Column(name="F_PATH7", length=200)

    public String getFPath7() {
        return this.FPath7;
    }
    
    public void setFPath7(String FPath7) {
        this.FPath7 = FPath7;
    }
    
    @Column(name="F_PATH8", length=200)

    public String getFPath8() {
        return this.FPath8;
    }
    
    public void setFPath8(String FPath8) {
        this.FPath8 = FPath8;
    }
    
    @Column(name="F_BRAND", length=200)

    public String getFBrand() {
        return this.FBrand;
    }
    
    public void setFBrand(String FBrand) {
        this.FBrand = FBrand;
    }
    
    @Column(name="F_COLOR", length=200)

    public String getFColor() {
        return this.FColor;
    }
    
    public void setFColor(String FColor) {
        this.FColor = FColor;
    }
    
    @Column(name="F_SIZE", length=200)

    public String getFSize() {
        return this.FSize;
    }
    
    public void setFSize(String FSize) {
        this.FSize = FSize;
    }
    
    @Column(name="F_LABEL", length=2000)

    public String getFLabel() {
        return this.FLabel;
    }
    
    public void setFLabel(String FLabel) {
        this.FLabel = FLabel;
    }
    
    @Column(name="F_SALE_NUM")

    public Integer getFSaleNum() {
        return this.FSaleNum;
    }
    
    public void setFSaleNum(Integer FSaleNum) {
        this.FSaleNum = FSaleNum;
    }
    
    @Column(name="F_WISH_ITEM", length=44)

    public String getFWishItem() {
        return this.FWishItem;
    }
    
    public void setFWishItem(String FWishItem) {
        this.FWishItem = FWishItem;
    }
   








}