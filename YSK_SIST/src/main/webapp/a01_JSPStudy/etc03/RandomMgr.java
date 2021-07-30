package etc03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RandomMgr {

		private DBConnectionMgr pool;
		String id[] = {"a100","a101","a102","a103","a104","a105","a106","a107","a108","a109"};
		String pwd = "1234";
		String name[] = {"���缮","�̱���","�ϵ���","������","���ҹ�","������","������","�缼��","����ȿ","�缼��"};

		public RandomMgr() {
			try {
				pool = DBConnectionMgr.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//ȸ�� 10�� �Է�
		public void postPMember() {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert tblPMember(id,pwd,name,profile)values(?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				for (int i = 0; i < id.length; i++) {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id[i]);
					pstmt.setString(2, pwd);
					pstmt.setString(3, name[i]);
					pstmt.setString(4, "profile"+(i+1)+".jpg");
					pstmt.executeUpdate();
				}
				System.out.println("ȸ�� 10�� �Է� �Ϸ�");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//ȸ�� 1��� 10�� PhotoBlog �Է�
		public void postPBlog() {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "select id from tblPMember limit 0, 10";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				sql = "insert tblPBlog(id,message,pdate,photo)values(?,?,now(),?)";
				int cnt = 1;
				while(rs.next()) {
					String id = rs.getString(1);
					for (int i = 0; i < 10; i++) {
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, id + " " + (i+1)+" �޼����Դϴ�.");
						pstmt.setString(3, "photo"+cnt+".jpg");
						pstmt.executeUpdate();
						cnt++;
					}
				}
				System.out.println("ȸ�� 1��� 10�� PhotoBlog �Է� �Ϸ�");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		public static void main(String[] args) {
			RandomMgr mgr = new RandomMgr();
			mgr.postPMember();
			mgr.postPBlog();
		}
}


