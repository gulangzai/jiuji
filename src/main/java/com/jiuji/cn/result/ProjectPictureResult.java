package com.jiuji.cn.result;

import java.util.List;

import com.jiuji.cn.model.TBPictures;
import com.jiuji.cn.model.TPicture;
import com.jiuji.cn.model.TProduct;

import com.lanbao.base.PageData;

public class ProjectPictureResult {
 
	
	PageData tproduct;
	List<PageData> tbPictures = null;
	
 

	public ProjectPictureResult(PageData tproduct, List<PageData> tbPictures) {
		// TODO Auto-generated constructor stub
		this.tproduct = tproduct;
		this.tbPictures = tbPictures;
	}



	public PageData getTproduct() {
		return tproduct;
	}



	public void setTproduct(PageData tproduct) {
		this.tproduct = tproduct;
	}



	public List<PageData> getTbPictures() {
		return tbPictures;
	}



	public void setTbPictures(List<PageData> tbPictures) {
		this.tbPictures = tbPictures;
	}
 
}
