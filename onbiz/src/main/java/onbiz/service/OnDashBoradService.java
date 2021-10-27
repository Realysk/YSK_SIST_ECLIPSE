package onbiz.service;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import onbiz.dao.OnDashBoard_Dao;
import onbiz.vo.OnDashBoard;
import onbiz.vo.OnRisk;
import onbiz.vo.Onproject;

@Service
public class OnDashBoradService {
 
  @Autowired
  OnDashBoard_Dao dao; 
  
  public ArrayList<Onproject> getProject(){
    return dao.getProject();
  }
  
  public ArrayList<Onproject> getprojectst(){
    return dao.getprojectst();
  }
 
//1. 프로젝트갯수 
  public ArrayList getProjectCnt() {
   return dao.getProjectCnt();
  };
  
  
//2. 진행중 리스크 갯수
  public ArrayList<OnDashBoard> getRiskCnt() {
   // if(onproject.getRisk_cnt()==0) onproject.setRisk_cnt(0);
    return dao.getRiskCnt();
  };
  
//3. 진행중 작업 갯수 
  public ArrayList<OnDashBoard> getTaskCnt() {
   // if(onproject.getTask_cnt()==0) onproject.setTask_cnt(0);
    return dao.getTaskCnt();
  };
  
//4. 지연프로젝트 갯수 
  public ArrayList<OnDashBoard> getnProjectCnt() {
   // if(onproject.getNpro_cnt()==0) onproject.setNpro_cnt(0);
    return dao.getProjectCnt();
  };

//5. 리스크
  public ArrayList<OnDashBoard>getristst(){
    return dao.getristst();
  };
//6. 리스크테이블 
  public ArrayList<OnRisk>getrisklist(){
    return dao.getrisklist();
  }
//7. 미진업무통계 (재확인)
  public ArrayList<OnDashBoard>dproject() {
   return dao.dproject();
  }
   public OnDashBoard graphready() {
     return dao.graphready();
   }
   public OnDashBoard graphcomplete() {
   return dao.graphcomplete();
   }
   public OnDashBoard graphdelay() {
   return dao.graphdelay();
   }
   public OnDashBoard graphgoing() {
     return dao.graphgoing();
  }
  
}
