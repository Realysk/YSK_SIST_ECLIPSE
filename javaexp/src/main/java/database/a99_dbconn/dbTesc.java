package database.a99_dbconn;

import java.sql.*;

public class dbTesc {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			 
			//2] drivermanager 클래스의 getConnection() 메소드로 오라클에 연결 시도 
//			String url = "jdbc:oracle:thin:@110.93.182.83:1521:xe"; // 학원 고정IP  
			String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 개인 DB
        	String user = "system";       
        	String password = "1111";
        	Connection conn = DriverManager.getConnection(url, user, password);  //외부자원 예외 발생 
        	
        	System.out.println("데이터베이스 연결 성공");
        

			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       


	}

}
