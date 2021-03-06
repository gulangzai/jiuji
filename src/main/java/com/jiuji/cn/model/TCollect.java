package com.jiuji.cn.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * TCollect generated by hbm2java
 */
@Entity
@Table(name = "t_collect", catalog = "shop")
public class TCollect implements java.io.Serializable {

	private String FCollectId;
	private String FUserId;
	private String FProductId;
	private Integer FStatus;

	public TCollect() {
	}

	public TCollect(String FCollectId) {
		this.FCollectId = FCollectId;
	}

	public TCollect(String FCollectId, String FUserId, String FProductId, Integer FStatus) {
		this.FCollectId = FCollectId;
		this.FUserId = FUserId;
		this.FProductId = FProductId;
		this.FStatus = FStatus;
	}

	@Id

	@Column(name = "F_CollectId", unique = true, nullable = false, length = 44)
	public String getFCollectId() {
		return this.FCollectId;
	}

	public void setFCollectId(String FCollectId) {
		this.FCollectId = FCollectId;
	}

	@Column(name = "F_UserId", length = 44)
	public String getFUserId() {
		return this.FUserId;
	}

	public void setFUserId(String FUserId) {
		this.FUserId = FUserId;
	}

	@Column(name = "F_ProductId", length = 44)
	public String getFProductId() {
		return this.FProductId;
	}

	public void setFProductId(String FProductId) {
		this.FProductId = FProductId;
	}

	@Column(name = "F_Status")
	public Integer getFStatus() {
		return this.FStatus;
	}

	public void setFStatus(Integer FStatus) {
		this.FStatus = FStatus;
	}

}
