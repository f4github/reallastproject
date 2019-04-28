package global.sesoc.project.route.VO;

public class RouteVO {
/*	
	routeNum		number	primary key,	--경로번호
	id				varchar2(20) not null,	--작성자 ID
	title			varchar2(100),		--경로제목
	startDate		date,				--출발일
	endDate			date,				--도착일
	startPlace		varchar2(100),	--출발지(주소지 좌표)
	tripArea		varchar2(20),	--여행 지역
	male			number,
	female			number
*/
	
	private int routeNum;
	private String id;
	private String title;
	private String startDate;
	private String endDate;
	private String startPlace;
	private String tripArea;
	private int male;
	private int female;
	
	public RouteVO() {
	}

	public RouteVO(int routeNum, String id, String title, String startDate, String endDate, String startPlace,
			String tripArea, int male, int female) {
		this.routeNum = routeNum;
		this.id = id;
		this.title = title;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startPlace = startPlace;
		this.tripArea = tripArea;
		this.male = male;
		this.female = female;
	}

	@Override
	public String toString() {
		return "RouteVO [routeNum=" + routeNum + ", id=" + id + ", title=" + title + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", startPlace=" + startPlace + ", tripArea=" + tripArea + ", male=" + male
				+ ", female=" + female + "]";
	}

	public int getRouteNum() {
		return routeNum;
	}

	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartPlace() {
		return startPlace;
	}

	public void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}

	public String getTripArea() {
		return tripArea;
	}

	public void setTripArea(String tripArea) {
		this.tripArea = tripArea;
	}

	public int getMale() {
		return male;
	}

	public void setMale(int male) {
		this.male = male;
	}

	public int getFemale() {
		return female;
	}

	public void setFemale(int female) {
		this.female = female;
	}
	
	
	
	
	
	
	
	
	
	
}
