package global.sesoc.project.mall.VO;

import java.sql.Date;

public class ReplyVO {
	
	/*gdsNum number not null,
	userId varchar2(50) not null,
	repNum number primary key,
	repCon varchar2(2000) not null,
	repDate date default sysdate*/
	
	private String userId, repCon;
	private int gdsNum, repNum;
	private Date repDate;
	
	
	public ReplyVO() {
		super();
	}


	public ReplyVO(String userId, String repCon, int gdsNum, int repNum, Date repDate) {
		super();
		this.userId = userId;
		this.repCon = repCon;
		this.gdsNum = gdsNum;
		this.repNum = repNum;
		this.repDate = repDate;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getRepCon() {
		return repCon;
	}


	public void setRepCon(String repCon) {
		this.repCon = repCon;
	}


	public int getGdsNum() {
		return gdsNum;
	}


	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}


	public int getRepNum() {
		return repNum;
	}


	public void setRepNum(int repNum) {
		this.repNum = repNum;
	}


	public Date getRepDate() {
		return repDate;
	}


	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}


	@Override
	public String toString() {
		return "ReplyVO [userId=" + userId + ", repCon=" + repCon + ", gdsNum=" + gdsNum + ", repNum=" + repNum
				+ ", repDate=" + repDate + "]";
	}
	
	

}
