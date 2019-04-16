package global.sesoc.project.tiVO;

public class CommonVO {
	
	private String contentid;
	private String contenttypeid;
	private String createdtime;
	private String homepage;
	private String modifiedtime;
	private String tel;
	private String telname;
	private String title;
	private String firstimage;
	private String firstimage2;
	private int areacode;
	private int sigungucode;
	private String cat1;
	private String cat2;
	private String cat3;
	private String addr1;
	private String addr2;
	private String zipcode;
	private double mapx;
	private double mapy;
	private String mlevel;
	private String overview;
	
	public CommonVO() {

	}
	
	public CommonVO(String contentid, String contenttypeid, String createdtime, String homepage, String modifiedtime,
			String tel, String telname, String title, String firstimage, String firstimage2, int areacode,
			int sigungucode, String cat1, String cat2, String cat3, String addr1, String addr2, String zipcode,
			double mapx, double mapy, String mlevel, String overview) {

		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.createdtime = createdtime;
		this.homepage = homepage;
		this.modifiedtime = modifiedtime;
		this.tel = tel;
		this.telname = telname;
		this.title = title;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.cat1 = cat1;
		this.cat2 = cat2;
		this.cat3 = cat3;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipcode = zipcode;
		this.mapx = mapx;
		this.mapy = mapy;
		this.mlevel = mlevel;
		this.overview = overview;
	}
	@Override
	public String toString() {
		return "CommonVO [contentid=" + contentid + ", contenttypeid=" + contenttypeid + ", createdtime=" + createdtime
				+ ", homepage=" + homepage + ", modifiedtime=" + modifiedtime + ", tel=" + tel + ", telname=" + telname
				+ ", title=" + title + ", firstimage=" + firstimage + ", firstimage2=" + firstimage2 + ", areacode="
				+ areacode + ", sigungucode=" + sigungucode + ", cat1=" + cat1 + ", cat2=" + cat2 + ", cat3=" + cat3
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", mapx=" + mapx + ", mapy=" + mapy
				+ ", mlevel=" + mlevel + ", overview=" + overview + "]";
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(String contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getModifiedtime() {
		return modifiedtime;
	}
	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTelname() {
		return telname;
	}
	public void setTelname(String telname) {
		this.telname = telname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public int getAreacode() {
		return areacode;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public int getSigungucode() {
		return sigungucode;
	}
	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}

	
	
	

}
