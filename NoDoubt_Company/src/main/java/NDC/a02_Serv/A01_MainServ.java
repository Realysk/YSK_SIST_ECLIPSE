package NDC.a02_Serv;

import org.springframework.stereotype.Service;

@Service
public class A01_MainServ {
	
	public String Main() {
		
		System.out.println("출력 : " + Main());
		
		return "테스트";
	}

}
