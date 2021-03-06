package global.sesoc.project.user.VO;

	import java.sql.Date;

	public class LoginVO {
		
		/*create table tbl_member(
				userId varchar2(50) primary key,
				userPass varchar2(100) not null,
				userName varchar2(30) not null,
				userPhon varchar2(20) not null,
				userAddr1 varchar2(20) not null,
				userAddr2 varchar2(50) not null,
				userAddr3 varchar2(50) not null,
				regidate date default sysdate,
				verify number default 0
				);
	*/
		
		private String userId, userPass, userName, userPhon, userAddr1, userAddr2, userAddr3;
		
		private Date regDate;
		
		private int verify;

		public LoginVO() {
			super();
		}

		public LoginVO(String userId, String userPass, String userName, String userPhon, String userAddr1,
				String userAddr2, String userAddr3, Date regDate, int verify) {
			super();
			this.userId = userId;
			this.userPass = userPass;
			this.userName = userName;
			this.userPhon = userPhon;
			this.userAddr1 = userAddr1;
			this.userAddr2 = userAddr2;
			this.userAddr3 = userAddr3;
			this.regDate = regDate;
			this.verify = verify;
		}

		public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

		public String getUserPass() {
			return userPass;
		}

		public void setUserPass(String userPass) {
			this.userPass = userPass;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public String getUserPhon() {
			return userPhon;
		}

		public void setUserPhon(String userPhon) {
			this.userPhon = userPhon;
		}

		public String getUserAddr1() {
			return userAddr1;
		}

		public void setUserAddr1(String userAddr1) {
			this.userAddr1 = userAddr1;
		}

		public String getUserAddr2() {
			return userAddr2;
		}

		public void setUserAddr2(String userAddr2) {
			this.userAddr2 = userAddr2;
		}

		public String getUserAddr3() {
			return userAddr3;
		}

		public void setUserAddr3(String userAddr3) {
			this.userAddr3 = userAddr3;
		}

		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public int getVerify() {
			return verify;
		}

		public void setVerify(int verify) {
			this.verify = verify;
		}

		@Override
		public String toString() {
			return "LoginVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userPhon="
					+ userPhon + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3
					+ ", regDate=" + regDate + ", verify=" + verify + "]";
		}

		
		
}


