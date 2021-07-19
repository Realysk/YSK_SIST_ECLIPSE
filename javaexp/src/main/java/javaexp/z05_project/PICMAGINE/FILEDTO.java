package javaexp.z05_project.PICMAGINE;

public class FILEDTO {
	
	// String upload_id; // 업로드 코드
	String fileName; // 사용자 지정 파일명
	String fileRealName; // 실제 저장 파일명
	// String uploaded; // 업로드일
	
	public FILEDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FILEDTO(String fileName, String fileRealName) {
		super();
		 // this.upload_id = upload_id;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
		// this.uploaded = uploaded;
	}

//	public String getUpload_id() {
//		return upload_id;
//	}
//
//	public void setUpload_id(String upload_id) {
//		this.upload_id = upload_id;
//	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

//	public String getUploaded() {
//		return uploaded;
//	}
//
//	public void setUploaded(String uploaded) {
//		this.uploaded = uploaded;
//	}
	
}