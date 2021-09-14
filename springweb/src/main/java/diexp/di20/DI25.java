package diexp.di20;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import diexp.vo5.Dept;
import diexp.vo5.Emp;

public class DI25 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		AbstractApplicationContext ctx1 = new GenericXmlApplicationContext("diexp\\di20\\a25.xml");
		Emp obj1 = ctx1.getBean("emp", Emp.class);
		Dept obj2 = ctx1.getBean("dept", Dept.class);
		System.out.println(obj1);
		System.out.println(obj2);
		obj1.setEmpno(7777);
		obj1.setEname("홍길동");
		obj1.setJob("사원");
		obj1.setMgr(20);
		obj1.setHiredateS("2021-09-14");
		obj1.setSal(3000);
		obj1.setComm(100);
		obj1.setDeptno(10);
		//obj2.setDeptno(10);
		obj2.setDname("회계");
		obj2.setLoc("서울");
		System.out.println("사원번호 : " + obj1.getEmpno());
		System.out.println("사원명 : " + obj1.getEname());
		System.out.println("직책 : " + obj1.getJob());
		System.out.println("관리자번호 : " + obj1.getMgr());
		System.out.println("입사일 : " + obj1.getHiredateS());
		System.out.println("급여 : " + obj1.getSal());
		System.out.println("보너스 : " + obj1.getComm());
		System.out.println("부서번호 : " + obj1.getDeptno());
		//System.out.println("부서번호 : " + obj2.getDeptno());
		System.out.println("부서명 : " + obj2.getDname());
		System.out.println("부서지역 : " + obj2.getLoc());
		ctx1.close();

	}

}