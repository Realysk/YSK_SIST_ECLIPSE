package springweb.a05_mvc.a03_dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	
	/*
	 09.28 
	 ex) 다음의 SQL을 처리한 DAO, Mapper 내용을 선언하세요.
	 	1) SELECT * FROM emp LIKE '%'||#{job}||'%'
	 		결과값 : ArrayList<Emp>
	 		입력값 : String job
	 		
	 	2) SELECT deptno, MAX(sal) sal FROM emp
	 	   GROUP BY deptno
	 	   HAVING MAX(sal) > #{sal}
	 		결과값 : ArrayList<Emp>
	 		입력값 : double sal
	 	
	 	3) SELECT COUNT(*) FROM emp
	 	   WHERE sal BETWEEN #{minsal} AND #{maxsal}
	 	   	결과값 : int
	 	   	입력값 : (int minsal, int maxsal)
	 	   			(Map<String, Integer>)
	 	   			
	*/

	public ArrayList<Emp> schJob(String job);
	
	public ArrayList<Emp> groupDept(double sal);
	
	public int countEmp(@Param("minsal") int minsal, @Param("maxsal") int maxsal);
	// service단 처리 : return dao.countEmp(1000,3000);
	public int countEmp2(Map<String, Integer> map);
	/*
	 service단 처리
	 Map<String, Integer> map = new HashMap<String, Integer>();
	 map.put("minsal", 1000);
	 map.put("maxsal", 3000);
	 return dao.countEmp2(map);
	 */
	
}