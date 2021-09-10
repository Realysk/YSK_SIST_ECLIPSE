package diexp.vo;

import java.util.Properties;
import java.util.Set;
// diexp.vo.Sensor
public class Sensor {
	
	// Set 인터페이스가 처리되는 객체 선언과 할당 메서드 선언.
	private Set<String> agent;
	// key/value 형식 Properties 객체 선언
	private Properties addInfo;

	public Set<String> getAgent() {
		return agent;
	}

	public void setAgent(Set<String> agent) {
		this.agent = agent;
	}

	public Properties getAddInfo() {
		return addInfo;
	}

	public void setAddInfo(Properties addInfo) {
		this.addInfo = addInfo;
	}

	public String toString() {
		return "Sensor [agent = " + agent + ", addInfo=" + addInfo + "]";
	}

}
