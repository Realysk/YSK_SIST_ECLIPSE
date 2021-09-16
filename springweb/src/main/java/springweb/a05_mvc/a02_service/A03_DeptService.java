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
	
	public ArrayList<Dept> dlist() {	
		return dao.dlist();
	}
}