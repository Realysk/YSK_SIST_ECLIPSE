package diexp.di10;

import java.util.HashSet;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import diexp.vo.Bus;

@Configuration
public class Con19 {
	@Bean
	public Bus getBus() {
		Bus b1 = new Bus();
		Set<String> sets = new HashSet<String>();
		sets.add("7780");
		sets.add("7790");
		sets.add("8080");
		Properties props = new Properties();
		props.setProperty("7780", "서울~수원");
		props.setProperty("7790", "서울~인천");
		props.setProperty("8080", "하남~서울");
		b1.setNumbers(sets);
		b1.setSection(props);
		return b1;
	}
}
