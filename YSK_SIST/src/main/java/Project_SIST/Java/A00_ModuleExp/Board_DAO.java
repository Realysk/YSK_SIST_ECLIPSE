package Project_SIST.Java.A00_ModuleExp;

//dao단는 실제객체로 작성해주세요.
//데이터도 실제로 넣어 주시구요.. ^^
//데이터가 들어간 리턴 객체..

//import java.util.ArrayList;
//import java.util.HashMap;
//
//import org.springframework.stereotype.Repository;
//
//import board.z01_vo.Board;
//import board.z01_vo.BoardFile;
//import board.z01_vo.BoardSch;
//import board.z01_vo.Member;
//// board.a03_dao.A01_BoardDao
//@Repository
//public interface A01_BoardDao {
//   public int totCnt(BoardSch sch);
//   public ArrayList<Board> boardList(BoardSch sch);
//   /*
//   {
//      // 조회데이터
////      sch.getWriter() // 작성자
////      sch.getSubject() // 제목
//      
////      // 출력한 데이터
//      ArrayList<Board> list  = new ArrayList<Board>();
//      list.add(new Board());
//      list.add(new Board());
//      list.add(new Board());
//      list.add(new Board());
//      
//      return list 
//   }
//   */
//   public void insertBoard(Board insert);   
//   public void uploadFile(BoardFile ins);
//   public Board getBoard(int no);
//   public ArrayList<BoardFile> fileInfo(int no);
//   public void uptReadCnt(int no);
//   public void updateBoard(Board upt);
//   public void updateFile(HashMap<String, String> hs);
//   public void deleteBoard(int no);   
//   public void deleteFile(int no);
//   public Member login(Member mem);
//}