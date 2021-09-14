package diexp.vo7.exp;

import java.util.Properties;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
// diexp.vo.Bus
import org.springframework.stereotype.Controller;

@Controller("bus01")
public class Bus {
	private String number;
	@Autowired
	private Driver driver;
	//  Set<String>버스번호 Properties를 통해 시작/종점
	private Set<String> numbers;
	private Properties section;
	
	public Bus() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Bus(String number, Driver driver) {
		super();
		this.number = number;
		this.driver = driver;
	}
	public Bus( Driver driver) {
		super();
		this.driver = driver;
	}	
	
	public void showBusInfo() {
		System.out.println("버스번호:"+number);
		if(driver!=null) {
			System.out.println("이름:"+driver.getName());
			System.out.println("주업무:"+driver.getRole());
		}
	}
	

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

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
		return "Bus [numbers="+numbers+", section="+section+"]";
	}
	
}
