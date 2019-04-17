package global.sesoc.project.mallVO;

import java.sql.Date;

public class CartVO {
	
	 /*cartNum     number          not null,
	    userId      varchar2(50)    not null,
	    gdsNum      number          not null,
	    cartStock   number          not null,
	    addDate     date            default sysdate,*/
	
	private int cartNum, gdsNum, cartStock;
	private String userId;
	private Date addDate;
	
	private int num, gdsPrice;
	private String gdsName, gdsSavedfile;
	
	public CartVO() {
		super();
	}

	

	public CartVO(int cartNum, int gdsNum, int cartStock, String userId, Date addDate, int num, int gdsPrice,
			String gdsName, String gdsSavedfile) {
		super();
		this.cartNum = cartNum;
		this.gdsNum = gdsNum;
		this.cartStock = cartStock;
		this.userId = userId;
		this.addDate = addDate;
		this.num = num;
		this.gdsPrice = gdsPrice;
		this.gdsName = gdsName;
		this.gdsSavedfile = gdsSavedfile;
	}



	public CartVO(int cartNum, int gdsNum, int cartStock, String userId, Date addDate) {
		super();
		this.cartNum = cartNum;
		this.gdsNum = gdsNum;
		this.cartStock = cartStock;
		this.userId = userId;
		this.addDate = addDate;
	}



	public int getCartNum() {
		return cartNum;
	}



	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}



	public int getGdsNum() {
		return gdsNum;
	}



	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}



	public int getCartStock() {
		return cartStock;
	}



	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public Date getAddDate() {
		return addDate;
	}



	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	
	



	public int getNum() {
		return num;
	}



	public void setNum(int num) {
		this.num = num;
	}



	public int getGdsPrice() {
		return gdsPrice;
	}



	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}



	public String getGdsName() {
		return gdsName;
	}



	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}



	public String getGdsSavedfile() {
		return gdsSavedfile;
	}



	public void setGdsSavedfile(String gdsSavedfile) {
		this.gdsSavedfile = gdsSavedfile;
	}



	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", gdsNum=" + gdsNum + ", cartStock=" + cartStock + ", userId=" + userId
				+ ", addDate=" + addDate + ", num=" + num + ", gdsPrice=" + gdsPrice + ", gdsName=" + gdsName
				+ ", gdsSavedfile=" + gdsSavedfile + "]";
	}



	

	
	

}
