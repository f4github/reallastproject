package global.sesoc.project.sns.VO;

public class SNSVO {

	private int boardnum;
	private String id;
	private String title;
	private String content;
	private String originalFile;
	private String savedFile;
	private String inputdate;
	private int liked;
	private int views;
	private String hashtag;
	private String location;
	
	public SNSVO() {
	}

	public SNSVO(int boardnum, String id, String title, String content, String originalFile, String savedFile,
			String inputdate, int liked, int views, String hashtag, String location) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.originalFile = originalFile;
		this.savedFile = savedFile;
		this.inputdate = inputdate;
		this.liked = liked;
		this.views = views;
		this.hashtag = hashtag;
		this.location = location;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
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

	public String getOriginalFile() {
		return originalFile;
	}

	public void setOriginalFile(String originalFile) {
		this.originalFile = originalFile;
	}

	public String getSavedFile() {
		return savedFile;
	}

	public void setSavedFile(String savedFile) {
		this.savedFile = savedFile;
	}

	public String getInputdate() {
		return inputdate;
	}

	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "SNSVO [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", originalFile=" + originalFile + ", savedFile=" + savedFile + ", inputdate=" + inputdate
				+ ", liked=" + liked + ", views=" + views + ", hashtag=" + hashtag + ", location=" + location + "]";
	}
}
