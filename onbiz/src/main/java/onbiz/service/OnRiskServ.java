package onbiz.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import onbiz.dao.OnRiskDao;
import onbiz.vo.OnEmp;
import onbiz.vo.OnProject_Member;
import onbiz.vo.OnRisk;
import onbiz.vo.OnRiskSch;
import onbiz.vo.OnRisk_File;
import onbiz.vo.OnTask;
import onbiz.vo.Onproject;

@Service
public class OnRiskServ {

  @Autowired(required = false)
  private OnRiskDao dao;
  
  public ArrayList<OnRisk> OnRiskList(OnRiskSch Sch){
    if(Sch.getRisk_name()==null) Sch.setRisk_name("");
    if(Sch.getRisk_state()==null) Sch.setRisk_state("");
    //1. 총게시물 갯수 
    Sch.setCount(dao.totCnt(Sch)); // 1. setCount 총 게시물 갯수 
    if(Sch.getPageSize()==0) { // 2. 한번에 보여줄 페이지크기
      Sch.setPageSize(5);
    }
    //총데이터건수/한번에보여줄페이지크기 
Sch.setPageCount((int)Math.ceil(Sch.getCount()/(double)Sch.getPageSize()));
    
//현재클릭한 페이지 ==0 이면, 클릭한 현재 페이지번호 1로 세팅 
if(Sch.getCurPage()==0) {Sch.setCurPage(1);}

//현재클릭한페이지>총페이지수(현재 페이지는 총 페이지수를 넘지못한다..
if(Sch.getCurPage()>Sch.getPageCount()) {
  Sch.setCurPage(Sch.getPageCount());
}
System.out.println("현재 페이지 번호:"+Sch.getCurPage());
System.out.println("총 페이지수:"+Sch.getPageCount());
Sch.setStart((Sch.getCurPage()-1)*Sch.getPageSize()+1);
Sch.setEnd(Sch.getCurPage()*Sch.getPageSize());
// 블럭 처리.
// 1. 블럭 크기 지정.
Sch.setBlockSize(5);
// 2. blocknum 지정 : 현재페이지번호/블럭의 크기
int blocknum = (int)(Math.ceil(Sch.getCurPage()/(double)Sch.getBlockSize()));
// 3. 마지막 블럭번호..
//    총페이지수가 23 ==> 한번에 보여줄 block의 수가 5   25로 나와 에러가 발생.
//    마지막 블럭번호는 총페이지수를 넘지 못하게 처리..
int endBlock = blocknum*Sch.getBlockSize();

if(endBlock>Sch.getPageCount()) {
    endBlock =Sch.getPageCount(); 
}

Sch.setEndBlock(endBlock);
Sch.setStartBlock((blocknum-1)*Sch.getBlockSize()+1);
/*
risk_state risk_name
 * */



    return dao.OnRiskList(Sch);
  }
  
  
  public OnRisk getOnRisk(int risk_no) {
    // 상세조회시, 조회카운트 up
    dao.uptReadCnt(risk_no);
    OnRisk b = dao.getRisk(risk_no);
    b.setRiskfile_name(dao.getRiskFile(risk_no));
    return b;
}
  
  public void insertOnRisk(OnRisk ins) {
    System.out.println("#첨부파일#"+ins.getReport().getOriginalFilename());
    dao.insertRisk(ins);
    uploadFile(ins.getRisk_no(), ins.getReport() );
}   
  
@Value("${upload0}")
private String upload2;
@Value("${tmpUpload0}")
private String tmpUpload2;
private void uploadFile(int Risk_no, MultipartFile report) {
    // 1. multipartfile 객체를 file객체로 변환.
    String fileName = report.getOriginalFilename();
    if(fileName!=null && !fileName.equals("")) {
        File tmpFile = new File(tmpUpload2+fileName);
        File orgFile = new File(upload2+fileName);
        try {
            // 변환
            report.transferTo(tmpFile);
            // 최종 웹 서버에 있는 파일 위치로 로딩.
            Files.copy(tmpFile.toPath(), orgFile.toPath(), 
                    StandardCopyOption.REPLACE_EXISTING);
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    // 2. DB처리하기
    dao.uploadFile(new OnRisk_File(fileName));
}
/*
public OnRisk fixing(Onproject sch) { 
  if(sch.getPro_no()==null) sch.setPro_no("");
   return dao.fixing(sch);
}
public OnRisk complete(Onproject sch) {
  if(sch.getPro_no()==null) sch.setPro_no("");
  return dao.complete(sch);
}
public OnRisk open(Onproject sch) {
  if(sch.getPro_no()==null) sch.setPro_no("");
  return dao.open(sch);
}
public OnRisk hold(Onproject sch) {
  if(sch.getPro_no()==null) sch.setPro_no("");
  return dao.hold(sch);
}
*/
//7. 프로젝트 리스트 
public ArrayList<Onproject> projectlist(String SessionEmpno) {
  return dao.projectlist(SessionEmpno);
}
//6. 작업 select box
public ArrayList<OnTask> tasklist(OnEmp empno){
  return dao.tasklist(empno);
}

public ArrayList<OnProject_Member> memname(OnTask taskno) {
  return dao.memname(taskno);
}
//8. 프로젝트 수정 
public void update(OnRisk update) {
  System.out.println(update.getRisk_no());
  System.out.println(update.getRisk_kind());
  System.out.println(update.getRisk_name());
  System.out.println(update.getPro_no());
  System.out.println(update.getRisk_state());
  System.out.println(update.getTask_no());
  System.out.println(update.getPro_no());
  dao.updateRisk(update);
}
//8. 리스크 삭제 
public void delete(OnRisk del) {
  dao.delRisk(del);
}
}
