package Project_SIST.Java.A05_Picmagine.upload;

public class UPLDTO {
	
	private String artno; // 작품 번호
	private String artcategory; // 카테고리
	private String artimgtitle; // 파일명 (작품 이미지)
	private String arttitle; // 작품 제목
	private String artcontent; // 작품 소개
	private String artdate; // 업로드일
	private String artpicauth = "작가"; // 저작권 권한
	
	public UPLDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UPLDTO(String artno, String artcategory, String artimgtitle, String arttitle, String artcontent,
			String artdate, String artpicauth) {
		super();
		this.artno = artno;
		this.artcategory = artcategory;
		this.artimgtitle = artimgtitle;
		this.arttitle = arttitle;
		this.artcontent = artcontent;
		this.artdate = artdate;
		this.artpicauth = artpicauth;
	}

	public String getArtno() {
		return artno;
	}

	public void setArtno(String artno) {
		this.artno = artno;
	}

	public String getArtcategory() {
		return artcategory;
	}

	public void setArtcategory(String artcategory) {
		this.artcategory = artcategory;
	}

	public String getArtimgtitle() {
		return artimgtitle;
	}

	public void setArtimgtitle(String artimgtitle) {
		this.artimgtitle = artimgtitle;
	}

	public String getArttitle() {
		return arttitle;
	}

	public void setArttitle(String arttitle) {
		this.arttitle = arttitle;
	}

	public String getArtcontent() {
		return artcontent;
	}

	public void setArtcontent(String artcontent) {
		this.artcontent = artcontent;
	}

	public String getArtdate() {
		return artdate;
	}

	public void setArtdate(String artdate) {
		this.artdate = artdate;
	}

	public String getArtpicauth() {
		return artpicauth;
	}

	public void setArtpicauth(String artpicauth) {
		this.artpicauth = artpicauth;
	}
	
}
