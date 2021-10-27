package onbiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import onbiz.service.OnDashBoradService;
import onbiz.vo.OnDashBoard;
import onbiz.vo.OnEmp;

@Controller
@SessionAttributes("login")
public class OnDashBoardCtrl {
  
  @Autowired 
  OnDashBoradService service;
  private OnEmp sessionEmp; 
  private String sessionEmpNo; 
  
  @ModelAttribute("login")
  public OnEmp getOnEmp() {
      return new OnEmp();
  }   
  
  //OnEmpCtrl컨트롤러에서 넘어오는 prcess : login객체로 auth_no 값을 받아온다.
  //http://localhost:7080/onbiz/dash.do
  @RequestMapping("dash.do")
  public String dash(@ModelAttribute("login") OnEmp login, Model d) {
    d.addAttribute("projectlist", service.getProject());
    d.addAttribute("projectst",service.getprojectst());
    d.addAttribute("procnt",service.getProjectCnt());
    d.addAttribute("riskcnt",service.getRiskCnt());
    d.addAttribute("taskcnt",service.getTaskCnt());
    d.addAttribute("nprocnt",service.getnProjectCnt());
    d.addAttribute("riskst", service.getristst());
    d.addAttribute("risktab", service.getrisklist());
    d.addAttribute("dproject", service.dproject());
    //=====================================================bar chart
    d.addAttribute("graph_complete",service.graphcomplete());
    d.addAttribute("graph_delay",service.graphdelay());
    d.addAttribute("graph_graphgoing",service.graphgoing());
    d.addAttribute("graph_ready",service.graphready());
    
    
    String returnURL = "";
    String loginInfo = login.getAuth_no();
    
    //pm대시보드 이동 
    if(loginInfo.equals("a01")) {
      returnURL = "OnDashBoard/DAS-001-pm";
    }
 
    //tm대시보드 이동 
    if(loginInfo.equals("a02")) {
      returnURL = "OnDashBoard/DAS-001-TM";
    }
 
    //hr대시보드 이동 
    if(loginInfo.equals("a03")) {
      returnURL = "OnDashBoard/DAS-001-HR";
    }
 
    //ceo대시보드 이동
    if(loginInfo.equals("a04")) {
      returnURL = "OnDashBoard/DAS-001-CEO";
    }
    
    return returnURL;
  }
}
