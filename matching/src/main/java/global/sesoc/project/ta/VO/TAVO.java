package global.sesoc.project.ta.VO;

public class TAVO {

	private String loginid;
	private String travelid;
	private String travelplace;
	private String firstimage;
	private int vote;
		
	public TAVO() {
		
	}

	public TAVO(String loginid, String travelid, String travelplace, String firstimage, int vote) {
		super();
		this.loginid = loginid;
		this.travelid = travelid;
		this.travelplace = travelplace;
		this.firstimage = firstimage;
		this.vote = vote;
	}

	public String getLoginid() {
		return loginid;
	}

	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}

	public String getTravelid() {
		return travelid;
	}

	public void setTravelid(String travelid) {
		this.travelid = travelid;
	}

	public String getTravelplace() {
		return travelplace;
	}

	public void setTravelplace(String travelplace) {
		this.travelplace = travelplace;
	}

	public String getfirstimage() {
		return firstimage;
	}

	public void setfirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public int getVote() {
		return vote;
	}

	public void setVote(int vote) {
		this.vote = vote;
	}

	@Override
	public String toString() {
		return "TAVO [loginid=" + loginid + ", travelid=" + travelid + ", travelplace=" + travelplace + ", firstimage="
				+ firstimage + ", vote=" + vote + "]";
	}
	
	
}