package global.sesoc.project.user.VO;

public class BoardVO {

	private int boardnum;
	private String title;
	private String content;
	private String originalfile;
	private String savedfile;
	private String hashtag; 
	private String inputdate;
	private int liked;
	private int views;
	private int status;
	
	
	public BoardVO() {
		
	}


	public BoardVO(int boardnum, String title, String content, String originalfile, String savedfile, String hashtag,
			String inputdate, int liked, int views, int status) {
		super();
		this.boardnum = boardnum;
		this.title = title;
		this.content = content;
		this.originalfile = originalfile;
		this.savedfile = savedfile;
		this.hashtag = hashtag;
		this.inputdate = inputdate;
		this.liked = liked;
		this.views = views;
		this.status = status;
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


	public String getHashtag() {
		return hashtag;
	}


	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
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


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", title=" + title + ", content=" + content + ", originalfile="
				+ originalfile + ", savedfile=" + savedfile + ", hashtag=" + hashtag + ", inputdate=" + inputdate
				+ ", liked=" + liked + ", views=" + views + ", status=" + status + "]";
	}
	
	
	
	
	
}
