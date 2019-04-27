package global.sesoc.project.ti.VO;

public class TI_CommentVO {
	private int num;
	private String id;
	private String text;
	private String contentid;
	private String inputdate;
	
	public TI_CommentVO() {

	}
	public TI_CommentVO(int num, String id, String text, String contentid, String inputdate) {
		this.num = num;
		this.id = id;
		this.text = text;
		this.contentid = contentid;
		this.inputdate = inputdate;
	}
	@Override
	public String toString() {
		return "TI_CommentVO [num=" + num + ", id=" + id + ", text=" + text + ", contentid=" + contentid
				+ ", inputdate=" + inputdate + "]";
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}

	
	
	
	
	
	
	
	
	
}
