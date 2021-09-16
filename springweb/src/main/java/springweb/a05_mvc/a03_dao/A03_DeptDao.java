package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;

import springweb.z01_vo.Dept;

public interface A03_DeptDao {
	
	// SELECT * FROM dept
	public ArrayList<Dept> dlist();

}
