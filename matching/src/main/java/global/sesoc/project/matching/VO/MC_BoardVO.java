package global.sesoc.project.matching.VO;

public class MC_BoardVO {
	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String inputdate;
	private int hits;
	private String originalfile;	//실제 파일이 저장될 때 파일의 이름이 저장
	private String savedfile;		//서버에서 관리 쉽게 바꾼 파일 이름이 저장


	private int routeNum;
	private String startDate;
	private String endDate;
	private String startPlace;
	private String tripArea;
	private int male;
	private int female;
	
	
	public MC_BoardVO(){
		
	}


	public MC_BoardVO(int boardnum, String id, String title, String content, String inputdate, int hits,
			String originalfile, String savedfile, int routeNum, String startDate, String endDate, String startPlace,
			String tripArea, int male, int female) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.inputdate = inputdate;
		this.hits = hits;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.routeNum = routeNum;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startPlace = startPlace;
		this.tripArea = tripArea;
		this.male = male;
		this.female = female;
	}


	@Override
	public String toString() {
		return "MC_BoardVO [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", inputdate=" + inputdate + ", hits=" + hits + ", originalfile=" + originalfile + ", savedfile="
				+ savedfile + ", routeNum=" + routeNum + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", startPlace=" + startPlace + ", tripArea=" + tripArea + ", male=" + male + ", female=" + female
				+ "]";
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getInputdate() {
		return inputdate;
	}


	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}


	public String getOriginalfile() {
		return originalfile;
	}


	public void setOriginalfile(String originalfile) {
		this.originalfile = originalfile;
	}


	public String getSavedfile() {
		return savedfile;
	}


	public void setSavedfile(String savedfile) {
		this.savedfile = savedfile;
	}


	public int getRouteNum() {
		return routeNum;
	}


	public void setRouteNum(int routeNum) {
		this.routeNum = routeNum;
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
