 package onbiz.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JacksonInject;

import onbiz.vo.OnEmp;



public interface OnEmpDao {
	// 로그인 체크
	public OnEmp loginCheck(OnEmp onemp);
	// 로그아웃
	public void logout(HttpSession session);
	// 로그인
	public OnEmp login(OnEmp onEmp);
	// 조회
	public ArrayList<OnEmp> onEmpList(String sch); 
	// 상세조회
	public ArrayList<OnEmp> onEmpList2(String sch2); 
	//신규사원 추가
	public void insertUser(OnEmp onemp);
	// 사원 삭제
	/*
	public void deleteUser(int seq) {
		 .update(,seq);
	}*/
	
/*
 DAOImpl
 
 @Inject
 private SqlSession sql;
 
 private static String namespace = " "  -- onbiz.dao.OnEmpDao, OnEmp_mapper
 
 @Override
 public void register(OnEmp onemp) throws Exception{
 	sql.insert(namespace +".register", onemp);
 }
 
 */

}
