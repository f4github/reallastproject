package global.sesoc.project.matching.VO;

public class Matching_likeVO {
	
/*	
	trip_like_num	number	primary key,
	boardnum		number,
	id				varchar2(20),
	title			varchar2(100),
	tripArea		varchar2(20)
	
	*/
	private int matching_like_num;
	private int boardnum;
	private String id;
	private String title;
	private String tripArea;
	
	public Matching_likeVO() {
	}

	public Matching_likeVO(int matching_like_num, int boardnum, String id, String title, String tripArea) {
		super();
		this.matching_like_num = matching_like_num;
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.tripArea = tripArea;
	}

	@Override
	public String toString() {
		return "Matching_likeVO [matching_like_num=" + matching_like_num + ", boardnum=" + boardnum + ", id=" + id
				+ ", title=" + title + ", tripArea=" + tripArea + "]";
	}

	public int getMatching_like_num() {
		return matching_like_num;
	}

	public void setMatching_like_num(int matching_like_num) {
		this.matching_like_num = matching_like_num;
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

	public String getTripArea() {
		return tripArea;
	}

	public void setTripArea(String tripArea) {
		this.tripArea = tripArea;
	}

	
	

}
