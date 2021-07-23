package Project_SIST.Java.A05_Picmagine.upload;

public class UPLDTO {
	
	private String title; // 게시물 제목
	private String contents; // 게시물 내용
	private String pic_file; // 파일명
	private String tag; // 태그
	private String storyname; // 스토리 제목
	private String storycontents; // 스토리 설명
	private String stroytitle; // 스토리 주제
	
	public UPLDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UPLDTO(String title, String contents, String pic_file, String tag, String storyname,
			String storycontents, String stroytitle) {
		super();
		this.title = title;
		this.contents = contents;
		this.pic_file = pic_file;
		this.tag = tag;
		this.storyname = storyname;
		this.storycontents = storycontents;
		this.stroytitle = stroytitle;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPic_file() {
		return pic_file;
	}

	public void setPic_file(String pic_file) {
		this.pic_file = pic_file;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getStoryname() {
		return storyname;
	}

	public void setStoryname(String storyname) {
		this.storyname = storyname;
	}

	public String getStorycontents() {
		return storycontents;
	}

	public void setStorycontents(String storycontents) {
		this.storycontents = storycontents;
	}

	public String getStroytitle() {
		return stroytitle;
	}

	public void setStroytitle(String stroytitle) {
		this.stroytitle = stroytitle;
	}
	
}
