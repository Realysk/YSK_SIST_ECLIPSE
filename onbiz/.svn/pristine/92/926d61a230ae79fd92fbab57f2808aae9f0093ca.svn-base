package onbiz.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import onbiz.service.OnRiskServ;
import onbiz.vo.OnEmp;
import onbiz.vo.OnRisk;
import onbiz.vo.OnRiskSch;
import onbiz.vo.OnTask;
import onbiz.vo.Onproject;

@Controller
//@SessionAttributes("OnRiskSch")
@RequestMapping("Onrisk.do")
@SessionAttributes("login,OnRiskSch")

public class OnRiskCtrl {

  @Autowired(required = false)
  private OnRiskServ service;
 
  private OnEmp sessionEmp; 
  private String sessionEmpNo; 
  private String sessionEmpName;
  private String sessionEmpauth;
  
  @ModelAttribute("login")
  public OnEmp getOnEmp() {
      return new OnEmp();
  }   
  //1. 리스크 리스트 
  // http://localhost:7080/onbiz/Onrisk.do?method=list
  @RequestMapping(params="method=list")
  public String OnRisk(@ModelAttribute("login") OnEmp login, OnRiskSch onrisk ,HttpSession 
      session, Onproject project,Model d) { // 모델어트리뷰트로 객체 이름으로 지원
   d.addAttribute("list", service.OnRiskList( onrisk ));
   System.out.println("초기화면(등록)");
   System.out.println(login.getEmp_korname());
   System.out.println(login.getEmp_no());
   System.out.println(login.getAuth_name());
   sessionEmpauth= login.getAuth_name();
   sessionEmpNo =login.getEmp_no();
   sessionEmpName = login.getEmp_korname();
 //  String emp_no2 = login.getEmp_no();
  // System.out.println(emp_no2);
   sessionEmpNo = login.getEmp_no();
   //d.addAttribute("hold", service.hold(project));
 //  d.addAttribute("fixing", service.fixing(project));
 //  d.addAttribute("open", service.open(project));
  // d.addAttribute("complete", service.complete(project));
   System.out.println(project.getPro_state());
 //  d.addAttribute("projectlist", service.projectlist(sessionEmpNo));
  return "OnRisk/RIS-001-riskboard";
  }
  
  //2. 리스크 상세 
  //http://localhost:7080/onbiz/Onrisk.do?method=detail?risk_no=1
  @RequestMapping(params="method=detail")
  public String boardDetail(@RequestParam("risk_no") int risk_no, @ModelAttribute("login") OnEmp login, Model d,HttpSession 
      session) {
    sessionEmpauth= login.getAuth_name();
    sessionEmpNo =login.getEmp_no();
    sessionEmpName = login.getEmp_korname();
    sessionEmpNo = login.getEmp_no();
    System.out.println(login.getEmp_korname());
    System.out.println(login.getEmp_no());
    System.out.println(login.getAuth_name());
    d.addAttribute("detail", service.getOnRisk( risk_no ));
    return "OnRisk/RIS-003-riskdetail";
}   
  
  //3. 리스크등록 
//F
  @RequestMapping(params="method=insertForm")
  public String insertForm(@ModelAttribute("login") OnEmp login,OnRisk onrisk, Model d,HttpSession 
      session) {
    sessionEmpauth= login.getAuth_name();
    sessionEmpNo =login.getEmp_no();
    sessionEmpName = login.getEmp_korname();
    sessionEmpNo = login.getEmp_no();
    d.addAttribute("sessionEmpauth",sessionEmpauth);
    d.addAttribute("sessionEmpNo",sessionEmpNo);
    d.addAttribute("sessionEmpName",sessionEmpName);
    d.addAttribute("sessionEmpNo",sessionEmpNo);
    d.addAttribute("projectlist", service.projectlist(sessionEmpNo));
      return "OnRisk/RIS-002-riskinsert"; 
  }   
  
  
  //http://localhost:7080/onbiz/Onrisk.do?method=tasklist&pro_no=pro1001&emp_no=1001
  @RequestMapping(params="method=tasklist")
  public String tasklist(@ModelAttribute("login") OnEmp login, OnEmp empno,Model d) {
    System.out.println(empno.getEmp_no());
    System.out.println(empno.getPro_no());
    d.addAttribute("tasklist", service.tasklist(empno)); 
    return "pageJsonReport";
  }
  

  @RequestMapping(params="method=memname")
  public String memname(@ModelAttribute("login") OnEmp login, OnTask taskno ,Model d) {
    System.out.println(taskno.getTask_no());
    d.addAttribute("memname", service.memname(taskno)); 
    return "pageJsonReport";
  }
  
  
  //4. 리스크등록 
  // http://localhost:7080/board/board.do?method=insert   
  @RequestMapping(params="method=insert")
  public String boardInsert(@ModelAttribute("login") OnEmp login,OnRisk ins,OnRiskSch onrisk, Model d,HttpSession 
      session) {
    sessionEmpauth= login.getAuth_name();
    sessionEmpNo =login.getEmp_no();
    sessionEmpName = login.getEmp_korname();
    sessionEmpNo = login.getEmp_no();
    System.out.println(login.getEmp_korname());
    System.out.println(login.getEmp_no());//사원번호 
    System.out.println(login.getAuth_name());
    System.out.println(ins.getRisk_name());//리스크명 
    System.out.println(ins.getMem_no());//멤버번호 
    System.out.println(ins.getTask_no());//작업번호 
    System.out.println(ins.getPro_no()); //프로젝트번호 
    System.out.println(ins.getRisk_kind()); //유형 
    System.out.println(ins.getRisk_occdte()); //발생일 
      service.insertOnRisk(ins);
      d.addAttribute("projectlist", service.projectlist(sessionEmpNo));
      d.addAttribute("list", service.OnRiskList( onrisk ));
   //   d.addAttribute("projectlist", service.projectlist(sessionEmpNo));
      return "OnRisk/RIS-001-riskboard";
  }
  
  //5. 리스크 수정 
  // http://localhost:7080/board/board.do?method=update   
  @RequestMapping(params="method=update")
  public String OnriskUpdate(@ModelAttribute("login") OnEmp login,OnRisk upt, Model d,HttpSession 
      session) {
    sessionEmpauth= login.getAuth_name();
    sessionEmpNo =login.getEmp_no();
    sessionEmpName = login.getEmp_korname();
    sessionEmpNo = login.getEmp_no();
    System.out.println(login.getEmp_korname());
    System.out.println(login.getEmp_no());
    System.out.println(login.getAuth_name());
    d.addAttribute("projectlist", service.projectlist(sessionEmpNo));
      service.update(upt);
      return "forward:/Onrisk.do?method=detail";
  }     
  
  ///6. 리스크 삭제 
  @RequestMapping(params="method=delete")
  public String OnriskDelete(@ModelAttribute("login") OnEmp login,OnRisk del,OnRiskSch onrisk , Model d,HttpSession 
      session) {
    sessionEmpauth= login.getAuth_name();
    sessionEmpNo =login.getEmp_no();
    sessionEmpName = login.getEmp_korname();
    sessionEmpNo = login.getEmp_no();
    System.out.println(login.getEmp_korname());
    System.out.println(login.getEmp_no());
    System.out.println(login.getAuth_name());
    d.addAttribute("projectlist", service.projectlist(sessionEmpNo));

    service.delete(del);
    onrisk.setRisk_name("");
    onrisk.setRisk_state("");
    
    d.addAttribute("list", service.OnRiskList( onrisk ));   
    return "OnRisk/RIS-001-riskboard";
  }

  
  
}
