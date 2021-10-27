package diexp.vo9;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
@Controller
public class ZergUser {
	private String userName;
	@Autowired
	@Qualifier("dron")
	private Larba unit;
	// 컨테이너 안에 Larba로 자동할 수 있는 객체가 
	// 여러 개일 때, 하나만 특정지을 수 있는 annotation @Qualifier("bean아이디")
	public ZergUser() {
		super();
		// TODO Auto-generated constructor stub
		userName="저거유저1";
	}
	public void playGame() {
		System.out.println("player:"+userName);
		if(unit!=null) {
			unit.attack();
		}
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUnit(Larba unit) {
		this.unit = unit;
	}
	
	
	
	
}
