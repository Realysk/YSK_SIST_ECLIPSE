package onbiz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


import onbiz.service.OnEmpServ;
import onbiz.vo.OnEmp;

@Controller
@SessionAttributes("/onemp/*")
// @SessionAttributes({"id", "name", "age"}) 다중 세션시 
public class OnEmpCtrl {

	
	@Autowired
	private OnEmpServ service;

	private HttpServletRequest request;

	@ModelAttribute("onemp")
	public OnEmp getOnEmp() {
		return new OnEmp();
	}

	// http://localhost:7080/onbiz/login.do
	@RequestMapping("login.do")
	public String login(OnEmp onemp, HttpSession session) throws Exception {
		System.out.println("login 메서드 확인 - 컨트롤러 -");

		System.out.println("전달 데이터 확인 : " + onemp);
		return "OnEmp/Login/login";
	}

	// 로그인 체크
	// http://localhost:7080/onbiz/loginCheck.do
	@RequestMapping("loginCheck.do")
	public String loginCheck(@ModelAttribute OnEmp onemp, HttpSession session) {
		String returnURL = "";
		System.out.println("전달 데이터 확인 : " + onemp);
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login"); // 기존 login 세션값 제거
		}
		OnEmp vo = service.login(onemp);
		if (vo != null) {
			session.setAttribute("login", vo);
			session.getAttribute("login");
			returnURL = "OnEmp/Login/LOGIN_SELECT"; //"OnDashBoard/DAS-001-pm" ? 새 페이지 하나 추가해서 설정하는게..
			System.out.println("onemp 전달 : " + onemp);
			System.out.println("vo : " + vo);
			System.out.println("세션 확인 :  " + session);
		} else {
			System.out.println("사원번호/비밀번호 불일치");
			returnURL = "OnEmp/Login/login";
		}
		return returnURL;
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println("세션 : " + session);
		session.removeAttribute("login");
		OnEmpServ.logout(session);
		return "OnEmp/Login/login";
	}

	// http://localhost:7080/onbiz/mvc1.do
	@GetMapping("mvc1.do")
	public String mvc1(Model d) {
		d.addAttribute("serviceMsg", service.call());
		return "OnEmp/Login/mvc1";
	}


// -----------------------------      조회      ------------------------------------------------------
	// 사원정보조회 1, 상세 x, 사원번호/이름/권한/입사일/이메일/주소 출력
	// http://localhost:7080/onbiz/onEmpList.do
	@RequestMapping("onEmpList.do")
	public String onEmpList(@RequestParam(value="ename", defaultValue = "")String sch, Model d) {
		ArrayList<OnEmp> onEmpList = service.onEmpList(sch);
		System.out.println("개수:" + onEmpList.size());
		d.addAttribute("onEmpList", onEmpList);
		return "OnEmp/HR_EMPCK-01";
	}	

	//상세, 전체 조회
	// http://localhost:7080/onbiz/onEmpList2.do
	@RequestMapping("onEmpList2.do")
	public String viewMember(String sch2, Model d) {
		ArrayList<OnEmp> onEmpList2 = service.onEmpList2(sch2);
		System.out.println("개수:" + onEmpList2.size());
		d.addAttribute("onEmpList", onEmpList2);
		return "OnEmp/HR_EMPCK-02";
	}
	

// ------------ 검색 !! -------------------

	
		
// ---------------- 신규 ------------------	
	// 신규사원 등록 화면
	//http://localhost:7080/onbiz/registerFrm.do
	@RequestMapping("registerFrm.do")
	public String register(OnEmp onemp) {
			
		return "OnEmp/HR_EMP_01";
	}
	
	// 신규사원 등록 !! 
	//http://localhost:7080/onbiz/UserInsert.do
	@RequestMapping("UserInsert.do")
	public String insertUser(OnEmp onemp, Model d) {
			System.out.println(onemp.getEmp_no()+":,"+onemp.getPtn_no()+","+onemp.getDept_no()+
					","+onemp.getAuth_no()+","+onemp.getEmp_pass()+","+onemp.getEmp_korname()+","
					+onemp.getEmp_engname()+","+onemp.getEmp_email()+","+onemp.getEmp_hiredte()+","
					+onemp.getEmp_birth()+","+onemp.getEmp_content()+","+onemp.getEmp_profile()+","
					+onemp.getEmp_tel()+","+onemp.getEmp_addr()+","+onemp.getEmp_workst()+","
					+onemp.getEmp_workchdte());
			service.insertUser(onemp);
		return "redirect:/onEmpList.do";
		
	}
	
// ----------------- 수정 ----------------
	/*
	@RequestMapping(value="/edit.do")
	public String onEmpList(OnEmp onemp, Model d) throws Exception{
		d.addAttribute("edit", service.selectOneMemver(onemp.getEmp_no()));
		return "HR_EMPCK-03";
		
	} */

// ----------------- 삭제 ----------------
	/*
	@RequestMapping(value="/delete.do")
	public String list(OnEmp onemp) throws Exception{
		service.deleteUser(onemp.getEmp_no());
		return "onEmpList.do";
	} */
	
	// 로그인 폼
	// http://localhost:7080/onbiz/loginFrm.do

	@RequestMapping("loginFrm.do")
	public String loginFrm(OnEmp onemp) {

		return "OnEmp/Login/NewFile";
	}

}
