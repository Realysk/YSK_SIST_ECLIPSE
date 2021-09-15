package diexp.vo9;

import org.springframework.stereotype.Controller;

@Controller
public abstract class Larba {
	private String kind;
	public Larba(String kind) {
		this.kind = kind;
	}
	public abstract void attack();
	public String getKind() {
		return kind;
	}
}
