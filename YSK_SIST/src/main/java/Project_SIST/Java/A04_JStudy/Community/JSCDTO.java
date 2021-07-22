package Project_SIST.Java.A04_JStudy.Community;

public class JSCDTO {
	private int writeNum = 0; // 게시물 번호
	private String headLine; // 제목
	private String writer; // 작성자
	private String writeDate; // 작성일
	private String write; // 작성 내용
	private String comment; // 댓글
	private String goodJob; // 좋아요
	
	public JSCDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JSCDTO(int writeNum, String headLine, String writer, String writeDate, String write, String comment, String goodJob) {
		super();
		this.writeNum = writeNum;
		this.headLine = headLine;
		this.writer = writer;
		this.writeDate = writeDate;
		this.write = write;
		this.comment = comment;
		this.goodJob = goodJob;
	}
	
	public int getWriteNum() {
		return writeNum;
	}

	public void setWriteNum(int writeNum) {
		this.writeNum = writeNum;
	}

	public String getHeadLine() {
		return headLine;
	}

	public void setHeadLine(String headLine) {
		this.headLine = headLine;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getGoodJob() {
		return goodJob;
	}

	public void setGoodJob(String goodJob) {
		this.goodJob = goodJob;
	}

	@Override
    public String toString() {
        return " \n # 게시물 번호 : " + writeNum + "\n" +
        		" # 제목 : " + headLine + "\n" +
        		" # 작성자 : " + writer + "\n" +
        		" # 작성일 : " + writeDate + "\n" +
        		" # 작성 내용 : " + write + "\n" +
        		" # 댓글 : " + comment + "\n" +
        		" # 좋아요 ! " + goodJob + "\n" + "\n";
    }
	
}
