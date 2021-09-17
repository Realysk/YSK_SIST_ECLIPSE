package springweb.a05_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a05_mvc.a02_service.A04_MemberService;
import springweb.z01_vo.Member;


@Controller
public class A04_MemberController {
	@Autowired
	private A04_MemberService service;
	// memberList.do
	// http://localhost:7080/springweb/memberList.do
	@RequestMapping("memberList.do")
	public String mvc01(Member sch, Model d) {
		d.addAttribute("memList", service.memberList(sch));
		return "WEB-INF\\views\\a05_mvc\\a04_memberList.jsp";
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
		// 수정 후, 조회리스트 처리..
		service.updateMember(upt);
		return "redirect:/memberList.do";
	}		
	@RequestMapping("memberDelete.do")
	public String memberDelete(@RequestParam("id") String id) {
		//d.addAttribute("memList", service.memberList(sch));
		// 삭제 후, 조회리스트 처리..
		service.deleteMember(id);
		return "redirect:/memberList.do";
	}		
}
