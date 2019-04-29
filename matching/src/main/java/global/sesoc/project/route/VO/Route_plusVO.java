package global.sesoc.project.route.VO;

public class Route_plusVO {

	
/*
			rpNum			number	primary key,	--경유지 고유번호
			routeNum		number,					--루트 번호
			id				varchar2(20),			--작성자 ID
			title			varchar2(100),		--경로제목
			plus			varchar2(300),		--추가한 경유지 제목
			mapx			varchar2(100),		--경유지 좌표
			mapy			varchar2(100)		--경유지 좌표
*/
	
	private int rpNum;
	private int routeNum;
	private String id;
	private String title;
	private String plus;
	private String mapx;
	private String mapy;
	
	public Route_plusVO() {
	}

	public Route_plusVO(int rpNum, int routeNum, String id, String title, String plus, String mapx, String mapy) {
		super();
		this.rpNum = rpNum;
		this.routeNum = routeNum;
		this.id = id;
		this.title = title;
		this.plus = plus;
		this.mapx = mapx;
		this.mapy = mapy;
	}

	@Override
	public String toString() {
		return "Route_plusVO [rpNum=" + rpNum + ", routeNum=" + routeNum + ", id=" + id + ", title=" + title + ", plus="
				+ plus + ", mapx=" + mapx + ", mapy=" + mapy + "]";
	}

	public int getRpNum() {
		return rpNum;
	}

	public void setRpNum(int rpNum) {
		this.rpNum = rpNum;
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

	public String getPlus() {
		return plus;
	}

	public void setPlus(String plus) {
		this.plus = plus;
	}

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	
	
	
	
}
