package global.sesoc.project.tiVO;

public class Travel_infoVO {
	
	
	private int boardnum;
	private String id;
	private String travelPlace;
	private String content;
	private int views ;
	private double mapx ;
	private double mapy ;
	private int sigungucode ;
	private String address ;
	private String zipcode ;
	private String firstimage ;
	private String firstimage2 ;
	private int vote ;
	private String hashtag;
	private String tel;
	
	
	public Travel_infoVO() {
	}


	public Travel_infoVO(int boardnum, String id, String travelPlace, String content, int views, double mapx,
			double mapy, int sigungucode, String address, String zipcode, String firstimage, String firstimage2,
			int vote, String hashtag, String tel) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.travelPlace = travelPlace;
		this.content = content;
		this.views = views;
		this.mapx = mapx;
		this.mapy = mapy;
		this.sigungucode = sigungucode;
		this.address = address;
		this.zipcode = zipcode;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.vote = vote;
		this.hashtag = hashtag;
		this.tel = tel;
	}


	@Override
	public String toString() {
		return "Travel_infoVO [boardnum=" + boardnum + ", id=" + id + ", travelPlace=" + travelPlace + ", content="
				+ content + ", views=" + views + ", mapx=" + mapx + ", mapy=" + mapy + ", sigungucode=" + sigungucode
				+ ", address=" + address + ", zipcode=" + zipcode + ", firstimage=" + firstimage + ", firstimage2="
				+ firstimage2 + ", vote=" + vote + ", hashtag=" + hashtag + ", tel=" + tel + "]";
	}


	public int getBoardnum() {
		return boardnum;
	}


	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getTravelPlace() {
		return travelPlace;
	}


	public void setTravelPlace(String travelPlace) {
		this.travelPlace = travelPlace;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
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


	public int getSigungucode() {
		return sigungucode;
	}


	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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


	public int getVote() {
		return vote;
	}


	public void setVote(int vote) {
		this.vote = vote;
	}


	public String getHashtag() {
		return hashtag;
	}


	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}



	
	
	
	
}
