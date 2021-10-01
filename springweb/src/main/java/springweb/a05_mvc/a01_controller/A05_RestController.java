package springweb.a05_mvc.a01_controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springweb.a05_mvc.a02_service.A02_EmpService;
import springweb.z01_vo.Emp;

@RestController
public class A05_RestController {
    // 컨테이너의 객체끼리 자동 메모리 할당으로 처리한다.
    @Autowired
    private A02_EmpService service;
 
    // http://localhost:7080/springweb/empListAjax.do

    /*
	 @RequestMapping("empListAjax.do") 
	 public ResponseEntity<ArrayList<Emp>> mvc01(Emp sch) { 
		 return ResponseEntity.ok(service.getEmpList(sch)); 
	 }
	*/
	 
}