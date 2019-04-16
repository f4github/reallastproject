package global.sesoc.project.ti.VO;

public class Travel_intro_imgVO {
	
	private String resultCode;
	private String resultMsg;
	private int numOfRows;
	private int pageNo;
	private int totalCount;
	private String contentid;
	private String imgname;
	private String originimgurl;
	private String serialnum;
	private String smallimageurl;
	public Travel_intro_imgVO() {

	}
	public Travel_intro_imgVO(String resultCode, String resultMsg, int numOfRows, int pageNo, int totalCount,
			String contentid, String imgname, String originimgurl, String serialnum, String smallimageurl) {
		super();
		this.resultCode = resultCode;
		this.resultMsg = resultMsg;
		this.numOfRows = numOfRows;
		this.pageNo = pageNo;
		this.totalCount = totalCount;
		this.contentid = contentid;
		this.imgname = imgname;
		this.originimgurl = originimgurl;
		this.serialnum = serialnum;
		this.smallimageurl = smallimageurl;
	}
	@Override
	public String toString() {
		return "Travel_intro_imgVO [resultCode=" + resultCode + ", resultMsg=" + resultMsg + ", numOfRows=" + numOfRows
				+ ", pageNo=" + pageNo + ", totalCount=" + totalCount + ", contentid=" + contentid + ", imgname="
				+ imgname + ", originimgurl=" + originimgurl + ", serialnum=" + serialnum + ", smallimageurl="
				+ smallimageurl + "]";
	}
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMsg() {
		return resultMsg;
	}
	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}
	public int getNumOfRows() {
		return numOfRows;
	}
	public void setNumOfRows(int numOfRows) {
		this.numOfRows = numOfRows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
	public String getOriginimgurl() {
		return originimgurl;
	}
	public void setOriginimgurl(String originimgurl) {
		this.originimgurl = originimgurl;
	}
	public String getSerialnum() {
		return serialnum;
	}
	public void setSerialnum(String serialnum) {
		this.serialnum = serialnum;
	}
	public String getSmallimageurl() {
		return smallimageurl;
	}
	public void setSmallimageurl(String smallimageurl) {
		this.smallimageurl = smallimageurl;
	}
	
	
	
	
	

}
