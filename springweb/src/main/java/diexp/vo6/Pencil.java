package diexp.vo6;

import org.springframework.stereotype.Controller;

@Controller
public class Pencil {
	private String kind;
	public Pencil() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pencil(String kind) {
		super();
		this.kind = kind;
	}
	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
	
}
