package diexp.vo9;

import org.springframework.stereotype.Controller;

@Controller
public class Hydra extends Larba {

	public Hydra() {
		super("히드라");
		// TODO Auto-generated constructor stub
	}

	@Override
	public void attack() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"이 원거리 미사일 공격을 하다");
	}

}
