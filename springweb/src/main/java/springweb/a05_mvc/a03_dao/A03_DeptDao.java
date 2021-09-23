package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;

import springweb.z01_vo.Dept;
// springweb.a05_mvc.a03_dao.A03_DeptDao
public interface A03_DeptDao {
	// select * from dept
	public ArrayList<Dept> dlist(Dept sch);
	public void insertDept(Dept ins);
	public void updateDept(Dept upt);
	public void deleteDept(int deptno);	
}