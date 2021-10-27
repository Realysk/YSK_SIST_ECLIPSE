package javaexp.z99_database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class A01_Dao {   
/*
 * 
 * 
 * 
 * #자바를통한 데이터 베이스 처리 
 1. DAO(database 접근 객체) database access object
    1)생각해봅시다. 
       -소캣통신을 통한 여러가지 모듈을 필요로 한다. 
        (jdbc드라이버를 통해서 처리할 수 있다.)
       (기본적으로 메모리에 jdbc가 로딩 되어있어야 함)
       (각 DB서버 회사에서 지원한다. @@.jar 파일로 되어있다.
       우리도 실제로보면 jsp-api, ojdbc6, servlet 3개
      -DB연결을 위해 필요로하는 정보는 무엇이있을까
       ip, port, sid(식별자), 계정, 비밀번호 (데이터 접근시 필요한 기본정보) 
       -DB처리는 어떤 순서로 처리가 될까?
        dB는 서버 연결시 기본적으로 메모리(드라이브)를 메모리에 [로딩]한다.
        휴대폰할때 [기지국] , [통신국] 그런 유선망통해서 접근하듯
        특정서버에 클라이언트가 접근할 수 있게끔 구축이 되어있어야 함.
        
        = DB서버가 있고
        = driver 메모리에 로딩되어야 하고
        = DB연결을 필요로 하는 정보를 통해서 연결 
        = 명령어를 통해서 서버에 요청(statement) 라는 객체를 통해서 요청한다. 
          (sql과 java에서 지원하는 statement객체를 통해 연결) 
          select(dql) :서버에서 해당명령의 결과값을 전달/ 결과물이 있고
           ==> 결과물을 받는 객체가 필요 ResultSet
           ==> 그것을 ArrayList<VO> 
          insert, update, delete(dml) :전달없음 /결과물이 없음 
          ==>DB처리만 하는 것이라 결과값없음. 
          ==>트랜잭션 처리와 함께 명령어인 commit, rollback을 처리 
          
        = 이것이 끝나면 자원을 해제
        = try catch 예외처리 (기타 DB처리시 발생하는 예외)
          try{} catch(SQLException e) 
          
 2) DAO 역할 
    -데이터 베이스 연결 
    -메서드를 통해 입력받은 데이터인 VO를 통해서
    조회를 하거나, 등록, 수정, 삭제를 처리한다. 
    -자원을 해제처리 
    
    /*DAO의 전역변수: 기능메서드에서 공통적으로 활용하는 필드*/ 
   //1. 데이터베이스의 연결을 처리하는 객체
   private Connection con;
   //2. 서버와 대화를 하는 객체
   private Statement stmt;
   private PreparedStatement psmt;
   //3. 결과값을 받는 객체. 
   private ResultSet rs;
   
   //-----------------------------------------------
   
   //공통기능메서드 (연결처리하는 기능메서드)
   public void setCon() throws SQLException { 
      //1. 드라이버 메모리 로딩
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } //필수예외처리
      //2. 특정 서버 접속 
         //1)서버정보
      String info = "jdbc:oracle:thin:@localhost:1521:xe";
      con = DriverManager.getConnection(info,"scott","tiger");
      System.out.println("접속성공!!");
      
   }
   
   public static void main(String[] args) {
      // TODO Auto-generated method stub
	   A01_Dao dao = new A01_Dao();
      try {
         dao.setCon();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

}