package diexp.di10;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import diexp.vo.Note;
import diexp.vo.Pencil;

@Configuration
public class Con18 {
	// xml된 container 선언 방식 ==> java 클래스로 된 container 선언방식
	@Bean
	public Note getNote() {
		Pencil pc = new Pencil("HB");
		Note nt = new Note("수업필기용노트");
		nt.setPc(pc);
		return nt;
	}
}
