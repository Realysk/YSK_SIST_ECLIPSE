package onbiz.dao;

import org.springframework.stereotype.Repository;
import onbiz.vo.*;
import java.util.*;

@Repository
public interface OnDashBoard_Dao {
  
  //1. 미진업무 테이블 
  public ArrayList<Onproject> getProject();
  //2. 진행중 프로젝트 통계 
  public ArrayList<Onproject> getprojectst();
  

//1. 프로젝트갯수 
  public ArrayList<OnDashBoard>getProjectCnt();
//2. 진행중 리스크 갯수
  public ArrayList<OnDashBoard>getRiskCnt();
//3. 진행중 작업 갯수 
  public ArrayList<OnDashBoard>getTaskCnt();
//4. 지연프로젝트 갯수 
  public ArrayList<OnDashBoard>getnProjectCnt();
//5. 리스크 
  public ArrayList<OnDashBoard>getristst();
//6. 리스크테이블 
  public ArrayList<OnRisk>getrisklist();
//7. 미진업무통계 (재확인 )
  public ArrayList<OnDashBoard>dproject();
//========================================================================
  
  public OnDashBoard graphready();
  public OnDashBoard graphcomplete();
  public OnDashBoard graphdelay();
  public OnDashBoard graphgoing();

}
