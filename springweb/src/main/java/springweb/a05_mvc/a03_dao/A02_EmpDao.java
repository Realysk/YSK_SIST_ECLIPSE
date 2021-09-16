package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import springweb.z01_vo.Emp;

// springweb.a05_mvc.a03_dao.A02_EmpDao
// ArrayList<Emp> getEmpList();
@Repository // 실제 mybatis가 만들어 준 실제 객체에서는 만들어지기에 생략해도 된다.
public interface A02_EmpDao {
	public ArrayList<Emp> getEmpList(Emp sch);
	
	public void updateEmp(Emp upt);
	
	public void deleteEmp(int empno);

	public ArrayList<Emp> schDept(int deptno);
	
	// empMapper.xml 에 처리하세요.
	
}