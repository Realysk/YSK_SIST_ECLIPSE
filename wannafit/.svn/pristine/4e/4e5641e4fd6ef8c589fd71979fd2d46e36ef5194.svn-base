package wannafit.content.funding;

import java.util.ArrayList;
import com.google.gson.Gson;
import wannafit.content.vo.BusInfo_VO;
import wannafit.content.vo.Com_Info_VO;
import wannafit.content.vo.FunPro_VO;
import wannafit.content.vo.FunReq_VO;
import wannafit.content.vo.USER_VO;

// service ==> dao단 연동 처리..
// jspexp.a02_mvc.a02_service.A22_MemberService.java
public class FUN_serv {

    private FUN_dao dao2;
    private Gson gson;
    public FUN_serv() {
        // TODO Auto-generated constructor stub
       
        gson = new Gson();
        dao2 = new FUN_dao();
    }
    
    
 

    
   //======================================================================= 
    //1.사업자등록증 리스트가져오기 
    public String getbus() {
      return gson.toJson( dao2.getbus() );
    }
    
    
    //2.사업자등록증 등록 
    public String insertBus(BusInfo_VO businfo) {
      //String ret="등록성공";
   //   try {
          dao2.insertBus(businfo);
   //   }catch(Exception e) {
    //      ret="등록시 문제발생("+e.getMessage()+")";
    //  }
      // {"result":"결과","list":[]}
   //   return "{\"result\":\""+ret+"\",\"list\":"+getbus()+"}";
          return "등록성공1";
  }
    
    //=========================================================================
    //3. 회원 등록 
    public String insUser(USER_VO userinfo) {
      dao2.insertUse(userinfo);
      return "등록성공2";
    }
    //4. 기업등록
    public String insertCom(Com_Info_VO cominfo) {
      dao2.insertCom(cominfo);
      return "등록성공2";
    }
    //5. 펀딩리스트 조회 
    
    public String fundinglistpro() {
      ArrayList<FunPro_VO> fundinglist = dao2.getfundinglist();
      return "호출성공";
    }
    
    //6. 펀딩리스트 상세 
    public String getDtfundinglist(String code) {
      ArrayList<FunPro_VO> fundingdetail =dao2.getDtfundinglist(code);
      return "등록성공";
    }
    
    //7. 펀딩신청 service.insertfunding(Fun_Req_VO funding);
    public String insertfunding(FunReq_VO fundinfo){
          dao2.insertfunding(fundinfo);
 
          return "펀딩신청성공";
  }
    /*
    //8. 펀딩리스트 관리자 조회(전체) //전체 list 가져오는 dao 처리 및 json 데이터 만들기.
     public String getfundinglistAll() {
       gson.toJson(dao2.getfundinglistAll());
      return gson.toJson(dao2.getMemberList());
    
  } */
     //==========================================================
     //9. 펀딩리스트 검색 
     public String getFunList(FunPro_VO sch) {
       // dao의 ArrayList형태 데이터 gson.toJson으로 객체로 변환처리..
       return gson.toJson(dao2.getfunlist(sch));
   } 
     //10. 펀딩리스트 상세 조회 
     
     public String  getJsonFunding(String id) {
       // dao를 통해 나온 Emp객체를 gson으로 처리.
       String FundetailJson="{}";
       // 결과조회를 객체로 받기 
       FunPro_VO fundinglist = dao2.getFundetail(id);
       if(fundinglist!=null) {
         
         FundetailJson =  gson.toJson(fundinglist);
       }
       
       return FundetailJson;
   }
     
     
     public static void main(String[] args) {
      
     }
}
