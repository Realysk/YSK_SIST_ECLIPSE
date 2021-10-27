package springweb.a05_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A03_DeptDao;
import springweb.z01_vo.Dept;

@Service
public class A03_DeptService {
	@Autowired
	private A03_DeptDao dao;
	public ArrayList<Dept> dlist(Dept sch){
		if(sch.getLoc()==null) {
			sch.setLoc("");
		}
		return dao.dlist(sch);
	}
	public void insertDept(Dept ins) {
		dao.insertDept(ins);
	}
	public void updateDept(Dept upt) {
		dao.updateDept(upt);
	}
	public void deleteDept(int deptno) {
		dao.deleteDept(deptno);
	}		
}
