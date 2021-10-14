package springweb.a05_mvc.z04_vo;

public class FormCommand {
	
	private String id;
	private String[] loginType;
	private String jobCode;
	private String[] favoriteOs;
	private boolean allowNoti;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String[] getLoginType() {
		return loginType;
	}

	public void setLoginType(String[] loginType) {
		this.loginType = loginType;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String[] getFavoriteOs() {
		return favoriteOs;
	}

	public void setFavoriteOs(String[] favoriteOs) {
		this.favoriteOs = favoriteOs;
	}

	public boolean isAllowNoti() {
		return allowNoti;
	}

	public void setAllowNoti(boolean allowNoti) {
		this.allowNoti = allowNoti;
	}

}
