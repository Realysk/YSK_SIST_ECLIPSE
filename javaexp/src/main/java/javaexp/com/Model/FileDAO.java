package javaexp.com.Model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class FileDAO {
	
	private Connection con = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	private int result = 0 ;
	private static FileDAO instance = new FileDAO();
	
	public static FileDAO getInstance() {
		return instance;
	}
	
	// DB 연결
	public void getConnection() throws ClassNotFoundException, IOException, SQLException {
		InputStream in = (this.getClass().getResourceAsStream("../../../../db.properties"));
		Properties p = new Properties();
		p.load(in);
		
		String url = p.getProperty("dburl");
		String id = p.getProperty("dbid");
		String pw = p.getProperty("dbpw");

		Class.forName(p.getProperty("dbclass"));
		con = DriverManager.getConnection(url, id, pw);
	}
	
	// DB 연결 종료
	public void close() throws SQLException {
		if(rs!=null) rs.close();
		if(psmt!=null) psmt.close();
		if(con!=null) con.close();
	}
	
	// 파일 업로드
	public int uploadFile(String author, String title, String file) throws SQLException, ClassNotFoundException, IOException {
		getConnection();
		
		psmt = con.prepareStatement("insert into fileboard values(file_num.nextval,?,?,?,to_char(sysdate, 'YYYY-MM-DD'))");
		psmt.setString(1, author);
		psmt.setString(2, title);
		psmt.setString(3, file);
		
		result = psmt.executeUpdate();
		
		close();
		
		return result;
	}

	public ArrayList<FileVO> selectAll() throws ClassNotFoundException, IOException, SQLException {
		getConnection();
		
		ArrayList<FileVO> tempList = new ArrayList<>();
		psmt = con.prepareStatement("Select * from fileboard order by num ASC");
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			tempList.add(new FileVO(rs.getInt(1), //NUM
					rs.getString(2), 			  //AUTHOR
					rs.getString(3), 			  //TITLE
					rs.getString(4), 			  //FILENAME
					rs.getString(5))); 			  //DAY
		}
		
		close();
		
		return tempList;
	}

	public FileVO SelectOne(int num) throws ClassNotFoundException, IOException, SQLException {
		getConnection();
		
		psmt = con.prepareStatement("select * from fileboard where num=?");
		psmt.setInt(1, num);
		rs = psmt.executeQuery();
		
		FileVO vo = null;
		
		if(rs.next()) {
			vo = new FileVO(rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5));
		}
		
		close();
		
		return vo;
	}
	
}
