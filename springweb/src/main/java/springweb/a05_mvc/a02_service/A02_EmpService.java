package springweb.a05_mvc.a02_service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a05_mvc.a03_dao.A02_EmpDao;
import springweb.z01_vo.Emp;

@Service
public class A02_EmpService {
	@Autowired
	
	private A02_EmpDao dao;
	
	public ArrayList<Emp> getEmpList(Emp sch) {
		if(sch.getEname() == null) sch.setEname("");
		if(sch.getJob() == null) sch.setJob("");
		return dao.getEmpList(sch);
	}
	
	
	
}