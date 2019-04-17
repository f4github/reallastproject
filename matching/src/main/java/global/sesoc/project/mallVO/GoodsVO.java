package global.sesoc.project.mallVO;

import java.sql.Date;

public class GoodsVO {
	
	/*create table tbl_goods(
			gdsNum number primary key,
			gdsName varchar2(50) not null,
			cateCode varchar2(30) not null,
			gdsPrice number not null,
			gdsStock number,
			gdsDes varchar2(500) null,
			gdsImg varchar2(200) null,
			gdsDate date default sysdate
			);*/
	
	private int gdsNum, gdsPrice, gdsStock;
	private String gdsName, cateCode, gdsDes, gdsImg, gdsThumbImg, gdsOriginalfile, gdsSavedfile, userId;
	private Date gdsDate;
	
	private String cateCodeRef, cateName;
	
	public GoodsVO() {
		super();
	}
	
	
	

	public GoodsVO(int gdsNum, int gdsPrice, int gdsStock, String gdsName, String cateCode, String gdsDes,
			String gdsImg, String gdsThumbImg, String gdsOriginalfile, String gdsSavedfile, String userId, Date gdsDate,
			String cateCodeRef, String cateName) {
		super();
		this.gdsNum = gdsNum;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsName = gdsName;
		this.cateCode = cateCode;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsThumbImg = gdsThumbImg;
		this.gdsOriginalfile = gdsOriginalfile;
		this.gdsSavedfile = gdsSavedfile;
		this.userId = userId;
		this.gdsDate = gdsDate;
		this.cateCodeRef = cateCodeRef;
		this.cateName = cateName;
	}




	public GoodsVO(int gdsNum, int gdsPrice, int gdsStock, String gdsName, String cateCode, String gdsDes,
			String gdsImg, String gdsThumbImg, String gdsOriginalfile, String gdsSavedfile, String userId,
			Date gdsDate) {
		super();
		this.gdsNum = gdsNum;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsName = gdsName;
		this.cateCode = cateCode;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsThumbImg = gdsThumbImg;
		this.gdsOriginalfile = gdsOriginalfile;
		this.gdsSavedfile = gdsSavedfile;
		this.userId = userId;
		this.gdsDate = gdsDate;
	}




	public GoodsVO(int gdsNum, int gdsPrice, int gdsStock, String gdsName, String cateCode, String gdsDes,
			String gdsImg, String gdsThumbImg, String gdsOriginalfile, String gdsSavedfile, Date gdsDate) {
		super();
		this.gdsNum = gdsNum;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsName = gdsName;
		this.cateCode = cateCode;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsThumbImg = gdsThumbImg;
		this.gdsOriginalfile = gdsOriginalfile;
		this.gdsSavedfile = gdsSavedfile;
		this.gdsDate = gdsDate;
	}




	public GoodsVO(int gdsNum, int gdsPrice, int gdsStock, String gdsName, String cateCode, String gdsDes,
			String gdsImg, String gdsThumbImg, Date gdsDate) {
		super();
		this.gdsNum = gdsNum;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsName = gdsName;
		this.cateCode = cateCode;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsThumbImg = gdsThumbImg;
		this.gdsDate = gdsDate;
	}


	public GoodsVO(int gdsNum, int gdsPrice, int gdsStock, String gdsName, String cateCode, String gdsDes,
			String gdsImg, Date gdsDate) {
		super();
		this.gdsNum = gdsNum;
		this.gdsPrice = gdsPrice;
		this.gdsStock = gdsStock;
		this.gdsName = gdsName;
		this.cateCode = cateCode;
		this.gdsDes = gdsDes;
		this.gdsImg = gdsImg;
		this.gdsDate = gdsDate;
	}
	
	
	
	

	public String getCateCodeRef() {
		return cateCodeRef;
	}




	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}




	public String getCateName() {
		return cateName;
	}




	public void setCateName(String cateName) {
		this.cateName = cateName;
	}




	public String getUserId() {
		return userId;
	}




	public void setUserId(String userId) {
		this.userId = userId;
	}




	public String getGdsOriginalfile() {
		return gdsOriginalfile;
	}




	public void setGdsOriginalfile(String gdsOriginalfile) {
		this.gdsOriginalfile = gdsOriginalfile;
	}




	public String getGdsSavedfile() {
		return gdsSavedfile;
	}




	public void setGdsSavedfile(String gdsSavedfile) {
		this.gdsSavedfile = gdsSavedfile;
	}




	public String getGdsThumbImg() {
		return gdsThumbImg;
	}


	public void setGdsThumbImg(String gdsThumbImg) {
		this.gdsThumbImg = gdsThumbImg;
	}


	public int getGdsNum() {
		return gdsNum;
	}

	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	public int getGdsPrice() {
		return gdsPrice;
	}

	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}

	public int getGdsStock() {
		return gdsStock;
	}

	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}

	public String getGdsName() {
		return gdsName;
	}

	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getGdsDes() {
		return gdsDes;
	}

	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}

	public String getGdsImg() {
		return gdsImg;
	}

	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}

	public Date getGdsDate() {
		return gdsDate;
	}

	public void setGdsDate(Date gdsDate) {
		this.gdsDate = gdsDate;
	}




	@Override
	public String toString() {
		return "GoodsVO [gdsNum=" + gdsNum + ", gdsPrice=" + gdsPrice + ", gdsStock=" + gdsStock + ", gdsName="
				+ gdsName + ", cateCode=" + cateCode + ", gdsDes=" + gdsDes + ", gdsImg=" + gdsImg + ", gdsThumbImg="
				+ gdsThumbImg + ", gdsOriginalfile=" + gdsOriginalfile + ", gdsSavedfile=" + gdsSavedfile + ", gdsDate="
				+ gdsDate + "]";
	}

	
	

}
