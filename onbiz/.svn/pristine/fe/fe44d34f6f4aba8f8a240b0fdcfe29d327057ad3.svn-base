package onbiz.dao;

import java.util.ArrayList;
import onbiz.vo.OnEmp;
import onbiz.vo.OnProject_Member;
import onbiz.vo.OnRisk;
import onbiz.vo.OnRiskSch;
import onbiz.vo.OnRisk_File;
import onbiz.vo.OnTask;
import onbiz.vo.Onproject;
public interface OnRiskDao {
  
  //0. 리스크 조회수 
  public int totCnt(OnRiskSch sch);
  //1. 리스크 목록 불러오기 
  public ArrayList<OnRisk> OnRiskList(OnRiskSch Sch);
  
  //2. 리스크상세보기
  public OnRisk getRisk(int risk_no);
  
  //3. 파일 
  public String getRiskFile(int risk_no);
  
  //4. 조회수(?)
  public void uptReadCnt(int risk_no);
  
  //5. 리스크등록 
  public void insertRisk(OnRisk ins);
  
  //6. 파일 업로드 
  public void uploadFile(OnRisk_File ins);
  
  //7. 리스크 통계 
  //public OnRisk fixing(Onproject sch); //조치중
 // public OnRisk complete(Onproject sch); //완성 
  //public OnRisk open(Onproject sch); //오픈 
 // public OnRisk hold(Onproject sch); //홀드 
 
  //8. 프로젝트리스트(risk) 
  public ArrayList<Onproject> projectlist(String SessionEmpno);
  
  //9. 리스크 수정 
  public void updateRisk(OnRisk upt);
  
  //10. 리스크 삭제 
  public void delRisk(OnRisk del);
  
  //11. 작업리스트 불러오기 
  public ArrayList<OnTask> tasklist(OnEmp empno);
  
  //12. 
  public ArrayList<OnProject_Member> memname(OnTask taskno);
}
