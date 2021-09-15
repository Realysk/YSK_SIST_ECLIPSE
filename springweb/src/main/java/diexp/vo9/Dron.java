package diexp.vo9;

import org.springframework.stereotype.Controller;

@Controller
public class Dron extends Larba {

	public Dron() {
		super("드론");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind() + "이(가) 주로 채집하다가 약하게 원거리 공격을 하다.");
	}

}
