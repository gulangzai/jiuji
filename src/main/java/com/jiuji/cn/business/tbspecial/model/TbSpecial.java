package com.jiuji.cn.business.tbspecial.model;

import java.sql.Timestamp;


/**
 * TbSpecial entity. @author MyEclipse Persistence Tools
 */

public class TbSpecial  implements java.io.Serializable {


    // Fields    

     private Integer FNewUid;
     private String FSku;
     private Long FProductId;
     private Integer FStatus;
     private Timestamp FCreateDate;
     private String FCreateUser;


    // Constructors

    /** default constructor */
    public TbSpecial() {
    }

    
    /** full constructor */
    public TbSpecial(String FSku, Long FProductId, Integer FStatus, Timestamp FCreateDate, String FCreateUser) {
        this.FSku = FSku;
        this.FProductId = FProductId;
        this.FStatus = FStatus;
        this.FCreateDate = FCreateDate;
        this.FCreateUser = FCreateUser;
    }

   
    // Property accessors

    public Integer getFNewUid() {
        return this.FNewUid;
    }
    
    public void setFNewUid(Integer FNewUid) {
        this.FNewUid = FNewUid;
    }

    public String getFSku() {
        return this.FSku;
    }
    
    public void setFSku(String FSku) {
        this.FSku = FSku;
    }

    public Long getFProductId() {
        return this.FProductId;
    }
    
    public void setFProductId(Long FProductId) {
        this.FProductId = FProductId;
    }

    public Integer getFStatus() {
        return this.FStatus;
    }
    
    public void setFStatus(Integer FStatus) {
        this.FStatus = FStatus;
    }

    public Timestamp getFCreateDate() {
        return this.FCreateDate;
    }
    
    public void setFCreateDate(Timestamp FCreateDate) {
        this.FCreateDate = FCreateDate;
    }

    public String getFCreateUser() {
        return this.FCreateUser;
    }
    
    public void setFCreateUser(String FCreateUser) {
        this.FCreateUser = FCreateUser;
    }
   








}