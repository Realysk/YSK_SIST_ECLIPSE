package onbiz.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import onbiz.dao.OnEmpDao;
import onbiz.vo.OnEmp;

@Service
public class OnEmpServ {

	/* dao에 이 내용 잇음
	public void register(OnEmp onEmp) throws Exception;
	
	public OnEmp login(OnEmp onEmp) throws Exception;

	 */
	
	 private HttpSession session;
	
	@Autowired
	private OnEmpDao dao;
	
	
	//로그인
	public OnEmp login(OnEmp onemp){
		return dao.login(onemp);
	} 
	// 로그인 체크
	public OnEmp loginCheck(OnEmp onemp) {
		OnEmp result = dao.loginCheck(onemp);
		System.out.println(" 로그인 되었습니다!");
		if(result != null) {
			session.setAttribute("login", result);
			System.out.println(" 세션설정 되었습니다!");
		}
		return result;
	}
	//로그아웃
	public static void logout(HttpSession session){
		session.invalidate();
	}
	
	// 회원조회
	public ArrayList<OnEmp> onEmpList(String sch){
		if(sch ==null) sch = ""; // 검색.
		return dao.onEmpList(sch);
	} 
	public ArrayList<OnEmp> onEmpList2(String sch2){
		if(sch2 ==null) sch2 = ""; // 검색.
		return dao.onEmpList2(sch2);
	} 
	
	// 신규 사원 추가
	 public void insertUser(OnEmp onemp) {
		 dao.insertUser(onemp);
	 }

	/* 
	 // 사원 삭제
	 
	 public void deleteUser(int seq) {
		 dao.deleteUser(seq);
	 }
	 */

	 
	 
	 
	public Object call(){
		// TODO Auto-generated method stub
		return "서비스 호출1";
	}



	
}

