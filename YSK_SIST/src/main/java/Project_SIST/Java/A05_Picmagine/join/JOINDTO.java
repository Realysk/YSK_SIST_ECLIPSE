package Project_SIST.Java.A05_Picmagine.join;

public class JOINDTO {
	
	private String memno; // 회원 번호
	private String memid; // ID
	private String mempw; // PW
	private String memtel; // Tel
	private String mememail; // 이메일
	private String memauth = "회원"; // 사용 권한
	
	public JOINDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JOINDTO(String memno, String memid, String mempw, String memtel, String mememail,
			String memauth) {
		super();
		this.memno = memno;
		this.memid = memid;
		this.mempw = mempw;
		this.memtel = memtel;
		this.mememail = mememail;
		this.memauth = memauth;
	}

	public String getMemno() {
		return memno;
	}

	public void setMemno(String memno) {
		this.memno = memno;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getMempw() {
		return mempw;
	}

	public void setMempw(String mempw) {
		this.mempw = mempw;
	}

	public String getMemtel() {
		return memtel;
	}

	public void setMemtel(String memtel) {
		this.memtel = memtel;
	}

	public String getMememail() {
		return mememail;
	}

	public void setMememail(String mememail) {
		this.mememail = mememail;
	}

	public String getMemauth() {
		return memauth;
	}

	public void setMemauth(String memauth) {
		this.memauth = memauth;
	}
	
	@Override
    public String toString() {
        
		return 	"[회원정보 등록 완료]" +
        		"\n" + " NO. " + memno + 
        		"\n" + " ID : " + memid + 
        		"\n" + " PW : " + mempw + 
        		"\n" + " TEL : " + memtel + 
        		"\n" + " EMAIL : " + mememail + 
        		"\n" + " AUTH : " + memauth + "\n";
    }


}
