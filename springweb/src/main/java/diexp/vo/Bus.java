package diexp.vo;

import java.util.Properties;
import java.util.Set;
// diexp.vo.Bus
public class Bus {

	// Set<String> 버스번호 Properties를 통해 시작/종점
	private Set<String> numbers;
	private Properties section;
	
	public Set<String> getNumbers() {
		return numbers;
	}
	
	public void setNumbers(Set<String> numbers) {
		this.numbers = numbers;
	}
	
	public Properties getSection() {
		return section;
	}
	
	public void setSection(Properties section) {
		this.section = section;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Bus [numbers = " + numbers + ", section = " + section + "]";
	}
	
	
	
	
	
}
