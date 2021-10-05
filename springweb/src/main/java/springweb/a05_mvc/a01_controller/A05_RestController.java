package springweb.a05_mvc.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springweb.a05_mvc.a02_service.A02_EmpService;
import springweb.a05_mvc.a02_service.A04_MemberService;
import springweb.z01_vo.Emp;
import springweb.z01_vo.Member;

@RestController
public class A05_RestController {
    // 컨테이너의 객체끼리 자동 메모리 할당으로 처리한다.
    @Autowired
    private A02_EmpService service;
    @Autowired
    private A04_MemberService mservice;
 
    
    // http://localhost:7080/springweb/empListAjax2.do
	@RequestMapping("empListAjax2.do") 
	public ArrayList<Emp> mvc01(Emp sch) { 
		return service.getEmpList(sch); 
	}
	
	// 컴파일 오류 (아마 노트북 기준으로 member 테이블이 갱신되지 않은것으로 보임)
	// http://localhost:7080/springweb/memberListAjax2.do 
	@RequestMapping("memberListAjax2.do")
	public ArrayList<Member> memberListAjax(Member sch) {
		return mservice.memberList(sch);
	}
	
	 
}