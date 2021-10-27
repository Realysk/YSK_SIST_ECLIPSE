package wannafit.content.funding;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import wannafit.content.vo.BusInfo_VO;
import wannafit.content.vo.Com_Info_VO;
import wannafit.content.vo.USER_VO;


/**
 * Servlet implementation class JOIN_COM_Ctrl
 */
@WebServlet(name = "join_com.do", urlPatterns = {"/join_com.do"})
public class JOIN_COM_ctrl extends HttpServlet {
  private static final long serialVersionUID = 1L;
  FUN_serv service;

  public JOIN_COM_ctrl() {
    super();
    // TODO Auto-generated constructor stub
    service = new FUN_serv();
  }

  /**
   * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
   */
  protected void service(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub

    // 1. 모델데이터 선언
    request.setCharacterEncoding("utf-8");
    String wb_regNum = request.getParameter("wb_regNum"); // 사업자등록번호
    String wb_regTitle = request.getParameter("wb_regTitle"); // 사업자 등록명 (이름)
    String wb_regPath = request.getParameter("wb_regPath"); // 사업자등록증 경로
    String proc = request.getParameter("proc");
    System.out.println("프로세스" + proc);
    System.out.println("사업자등록번호" + wb_regNum);
    System.out.println("사업자등록명" + wb_regTitle);
    System.out.println("사업자경로" + wb_regPath);

    String wm_id = request.getParameter("wm_id");//회원아이디 
    String wm_pass = request.getParameter("wm_pass"); // 비밀번호
    String wm_email = request.getParameter("wm_email"); // 이메일
    String wm_nick = request.getParameter("wm_nik"); // 닉네임
    String wm_tel = request.getParameter("wm_tel"); // 휴대폰번호
    String wm_usrGroup = request.getParameter("wm_usrGroup"); // 회원구분 (0, 100, 200, 300, 400)
 //   String wm_repCnt = request.getParameter("wm_repCnt"); // 신고횟수
    String wm_imgSrc = request.getParameter("wm_imgSrc");// 프로필이미지
  //  String wb_num = request.getParameter("wb_num");// 사업자번호
    
    String proc2 = request.getParameter("proc2");
    String proc3 = request.getParameter("proc3");
    System.out.println(wm_tel);
    System.out.println(proc);
    System.out.println(proc2);
    System.out.println(proc3);

    // String wm_id= request.getParameter("wm_id");//기업이메일 (세금계싼서발행)
    String bs_email = request.getParameter("bs_email");// 기업이메일 (세금계싼서발행)
    String bs_sns = request.getParameter("bs_sns");;// 기업 sns주소
    String bs_number = request.getParameter("bs_number"); // 기업전화번호
    String bs_address = request.getParameter("bs_address");// 기업주소
    String bs_ceo = request.getParameter("bs_ceo");// 대표자명
    String bs_accname = request.getParameter("bs_accname");// 예금주명
    String bs_accnum = request.getParameter("bs_accnum");// 계좌번호
    String bs_accnum_name = request.getParameter("bs_accnum_name");// 은행명
    String bs_busname = request.getParameter("bs_busname");// 상호명
    String bs_intro = request.getParameter("bs_intro");// 소개글
    String bs_pic_url = request.getParameter("bs_pic_url");// varchar2(100) --소개사진

    // 2. 초기화면 설정
    if (wb_regNum == null && proc2==null) {
      response.sendRedirect("content\\join_com\\JOIN_UI_01.jsp");
      // String page = "content\\JOIN\\JOIN_UI_01.jsp";
      // RequestDispatcher rd = request.getRequestDispatcher(page);
      // rd.forward(request, response);
    } 
    else {
      // 3-1. 사업자등록
      if (proc.equals("insert")) {
        // String page = "content\\JOIN\\JOIN_UI_02_RESULT.jsp";

        BusInfo_VO businfo = new BusInfo_VO();
        // System.out.println("1.객체생성");
        businfo.setWb_regNum(wb_regNum);
        businfo.setWb_regTitle(wb_regTitle);
        businfo.setWb_regPath(wb_regPath);
        System.out.println(wb_regNum);
        // System.out.println("2.객체에 담김");
        service.insertBus(businfo);
        // System.out.println(businfo);
        // System.out.println("3.DB에 담김");
        System.out.println("등록성공");
        // service.insertBus(new BusInfo_VO("wb_regNum","wb_regTitle","wb_regPath"));
        response.sendRedirect("content\\join_com\\JOIN_UI_2.jsp");
      }

      else {
        if (proc2.equals("userinfo")&&proc.equals("null2")) {
          System.out.println("2번화면등장");
       
       
          USER_VO userinfo = new USER_VO();
          userinfo.setWm_id(wm_id);
          System.out.println(wm_id);
          userinfo.setWm_pass(wm_pass);
          System.out.println(wm_pass);
          userinfo.setWm_email(wm_email);
          System.out.println(wm_email);
          userinfo.setWm_nick(wm_nick);
          System.out.println(wm_nick);
          userinfo.setWm_tel(wm_tel);
          System.out.println(wm_tel);
          userinfo.setWm_usrGroup(wm_usrGroup);
          System.out.println(wm_usrGroup);
         // userinfo.setWm_repCnt(0);
          userinfo.setWm_imgSrc(wm_imgSrc);
          System.out.println(wm_imgSrc);
          //userinfo.setWb_num(wb_num);
          //System.out.println(wb_num);
          
          
          
          service.insUser(userinfo);
          System.out.println("등록성공2");

          if (proc3 == null) {
            response.sendRedirect("content\\join_com\\JOIN_UI_3.jsp");
          }
        }else {
            if (proc3.equals("com")&&proc2.equals("null3")&&proc.equals("null4")) {
              
              Com_Info_VO cominfo = new Com_Info_VO();
              //cominfo.setWm_id(wm_id);
              cominfo.setBs_email(bs_email);
              System.out.println(bs_email);
              cominfo.setBs_sns(bs_sns);
              cominfo.setBs_number(bs_number);
              cominfo.setBs_address(bs_address);
              cominfo.setBs_ceo(bs_ceo);
              cominfo.setBs_accname(bs_accname);
              cominfo.setBs_accnum(bs_accnum_name);
              cominfo.setBs_accnum_name(bs_accnum_name);
              cominfo.setBs_busname(bs_busname);
              cominfo.setBs_intro(bs_intro);
              cominfo.setBs_pic_url(bs_pic_url);
              service.insertCom(cominfo);
              System.out.println("등록성공3");
          
              
              response.sendRedirect("content\\join_com\\JOIN_UI_4.jsp");
            }
          }
        }

      }
    }
  

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // TODO Auto-generated method stub

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();

    String savePath = "upload"; // 다운경로
    int uploadFileSizeLimit = 5 * 1024 * 1024;
    String encType = "UTF-8";

    ServletContext context = getServletContext();
    String uploadFilePath = context.getRealPath(savePath);
    System.out.println("서버상의 실제 디렉토리");
    System.out.println(uploadFilePath);
    // try {

    MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit,
        encType, new DefaultFileRenamePolicy());
    String fileName = multi.getFilesystemName("wb_regPath");

    if (fileName == null) {
      System.out.println("파일 업로드 안됌 ");

    } else {
      // out.println("글쓴이 :" +multi.getParameter("name"));
      // out.println("제목:"+multi.getParameter("title"));

      String page = "content\\join_com\\JOIN_UI_01.jsp";
      response.getWriter().print("파일명" + fileName);
      // out.println("파일명:"+fileName);
      RequestDispatcher rd = request.getRequestDispatcher(page);
      rd.forward(request, response);
    }
    // } catch(Exception e ) {
    // System.out.println("예외발생"+e);
    // }



  }
}


