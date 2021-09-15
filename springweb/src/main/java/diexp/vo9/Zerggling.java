package diexp.vo9;

import org.springframework.stereotype.Controller;

@Controller
public class Zerggling extends Larba {

	public Zerggling() {
		super("저글링");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind() + "이(가) 근접 빠른 공격을 하다.");
	}

}
