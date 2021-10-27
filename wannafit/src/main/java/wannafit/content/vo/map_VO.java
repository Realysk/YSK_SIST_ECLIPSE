package wannafit.content.vo;

public class map_VO {

	String fc_mapName;
	String fc_mapLoc;
	String fc_mapIntroduction;
	String fc_mapTrainer;
	
	public String getFc_mapName() {
		return fc_mapName;
	}
	public void setFc_mapName(String fc_mapName) {
		this.fc_mapName = fc_mapName;
	}
	public String getFc_mapLoc() {
		return fc_mapLoc;
	}
	public void setFc_mapLoc(String fc_mapLoc) {
		this.fc_mapLoc = fc_mapLoc;
	}
	public String getFc_mapIntroduction() {
		return fc_mapIntroduction;
	}
	public void setFc_mapIntroduction(String fc_mapIntroduction) {
		this.fc_mapIntroduction = fc_mapIntroduction;
	}
	public String getFc_mapTrainer() {
		return fc_mapTrainer;
	}
	public void setFc_mapTrainer(String fc_mapTrainer) {
		this.fc_mapTrainer = fc_mapTrainer;
	}
	@Override
	public String toString() {
		return "map_VO [fc_mapName=" + fc_mapName + ", fc_mapLoc=" + fc_mapLoc + ", fc_mapIntroduction="
				+ fc_mapIntroduction + ", fc_mapTrainer=" + fc_mapTrainer + "]";
	}
	public map_VO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public map_VO(String fc_mapName, String fc_mapLoc, String fc_mapIntroduction, String fc_mapTrainer) {
		super();
		this.fc_mapName = fc_mapName;
		this.fc_mapLoc = fc_mapLoc;
		this.fc_mapIntroduction = fc_mapIntroduction;
		this.fc_mapTrainer = fc_mapTrainer;
	}
}
