package diexp.vo;

public class Note {
	private String title;
	private Pencil pc;

	public Note() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Note(String title) {
		super();
		this.title = title;
	}

	public void showMyNote() {
		System.out.println("나의 노트:" + title);
		if (pc != null) {
			System.out.println("연필의 종류:" + pc.getKind());
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Pencil getPc() {
		return pc;
	}

	public void setPc(Pencil pc) {
		this.pc = pc;
	}

	public void setPencil1(Pencil pc) {
		this.pc = pc;
	}

}
