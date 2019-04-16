package global.sesoc.project.mall.VO;

public class CategoryVO {
	
	/*create table goods_category(
			cateName varchar2(20) not null,
			cateCode varchar2(30) not null,
			cateCodeRef varchar2(30) null,
			primary key(cateCode),
			foreign key(cateCodeRef) REFERENCES goods_category(cateCode)
			);
*/
	
	private String cateName, cateCode, cateCodeRef;
	private int level;
	
	

	public CategoryVO(String cateName, String cateCode, String cateCodeRef, int level) {
		super();
		this.cateName = cateName;
		this.cateCode = cateCode;
		this.cateCodeRef = cateCodeRef;
		this.level = level;
	}

	public CategoryVO() {
		super();
	}

	public CategoryVO(String cateName, String cateCode, String cateCodeRef) {
		super();
		this.cateName = cateName;
		this.cateCode = cateCode;
		this.cateCodeRef = cateCodeRef;
	}
	
	

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateCodeRef() {
		return cateCodeRef;
	}

	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}

	@Override
	public String toString() {
		return "CategoryVO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateCodeRef=" + cateCodeRef
				+ ", level=" + level + "]";
	}

	
	
}
