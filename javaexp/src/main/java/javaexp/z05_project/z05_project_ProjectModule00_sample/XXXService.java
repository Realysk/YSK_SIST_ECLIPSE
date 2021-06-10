package javaexp.z05_project.z05_project_ProjectModule00_sample;

import java.util.ArrayList;

import javaexp.z01_vo.Product;

public class XXXService {
	XXXDao dao = new XXXDao();
	public ArrayList<Product> schList(ProductSch sch) {
		System.out.println("# Service 단 처리 #");
		System.out.println("DAO에 전송 데이터 1 : " + sch.getName());
		System.out.println("DAO에 받은 데이터 크기 : " +
					dao.schList(sch).size());
		return dao.schList(sch);
	}
}
