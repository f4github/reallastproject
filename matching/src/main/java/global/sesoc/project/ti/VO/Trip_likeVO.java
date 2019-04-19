package global.sesoc.project.ti.VO;

public class Trip_likeVO {
	private int likenum;
	private String id;
	private String title;
	private String contentid;
	private String contenttypeid;
	
	public Trip_likeVO() {
	}

	public Trip_likeVO(int likenum, String id, String title, String contentid, String contenttypeid) {
		super();
		this.likenum = likenum;
		this.id = id;
		this.title = title;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
	}

	@Override
	public String toString() {
		return "Trip_likeVO [likenum=" + likenum + ", id=" + id + ", title=" + title + ", contentid=" + contentid
				+ ", contenttypeid=" + contenttypeid + "]";
	}

	public int getLikenum() {
		return likenum;
	}

	public void setLikenum(int likenum) {
		this.likenum = likenum;
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
	
	

	

}
