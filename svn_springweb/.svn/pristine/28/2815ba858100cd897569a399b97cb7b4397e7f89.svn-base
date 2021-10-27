package springweb.a05_mvc.a01_controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import springweb.a05_mvc.a02_service.A04_MemberService;
import springweb.z01_vo.Member;


@Controller
@SessionAttributes("member")
public class A04_MemberController {
	
	@Autowired
	private A04_MemberService service;
	
	
	@ModelAttribute("member")
	public Member getMember() {
		return new Member();
	}
	// http://localhost:7080/springweb/login.do
	@RequestMapping("login.do")
	public String login(Member member) {
		return "WEB-INF\\views\\a05_mvc\\a10_login.jsp";
	}
	// http://localhost:7080/springweb/login2.do
	@RequestMapping("login2.do")
	public String login2(Member member, HttpSession session) {
		if(member.getId()!=null) {
			session.setAttribute("member2",new Member("himan","7777","홍길동","관리자",80000));
		}
		return "WEB-INF\\views\\a05_mvc\\a10_login.jsp";
	}
	
	
	
	
	// memberList.do
	// http://localhost:7080/springweb/memberList.do
	@RequestMapping("memberList.do")
	public String mvc01(Member sch, Model d) {
		d.addAttribute("memList", service.memberList(sch));
		return "WEB-INF\\views\\a05_mvc\\a04_memberList.jsp";
	}
	// http://localhost:7080/springweb/memberFrm.do
	@GetMapping("memberFrm.do")
	public String memberFrm() {
		return "WEB-INF\\views\\a05_mvc\\a07_memberAjax.jsp";
	}
	@RequestMapping("memberListAjax.do")
	public String memberListAjax(Member sch, Model d) {
		d.addAttribute("memList", service.memberList(sch));
		return "pageJsonReport";
	}	
	
	@RequestMapping("memberInsertAjax.do")
	public String memberInsertAjax(Member insert) {
		service.insertMember(insert);
		return "redirect:/memberListAjax.do";
	}	
	
	// memberInsert.do
	@RequestMapping("memberInsert.do")
	public String memberInsert(Member insert) {
		//d.addAttribute("memList", service.memberList(sch));
		// 등록 후, 조회리스트 처리..
		service.insertMember(insert);
		return "redirect:/memberList.do";
	}	
	@RequestMapping("memberUpdate.do")
	public String memberUpdate(Member upt) {
		//d.addAttribute("memList", service.memberList(sch));
		// 등록 후, 조회리스트 처리..
		service.updateMember(upt);
		return "redirect:/memberList.do";
	}		
	@RequestMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id) {
		//d.addAttribute("memList", service.memberList(sch));
		// 등록 후, 조회리스트 처리..
		service.deleteMember(id);
		return "redirect:/memberList.do";
	}		
}





