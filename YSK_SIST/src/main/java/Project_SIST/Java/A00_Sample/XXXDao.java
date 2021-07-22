package Project_SIST.Java.A00_Sample;

import java.util.ArrayList;

import Project_SIST.Java.Z99_vo.Product;

// DB서버에 접속해 데이터를 가져올 필요성있는 때 사용

public class XXXDao {
/*
// select * 
// from product
// where name like '%'||'물건명'||'%'
//  and price between 가격의최소 and 가격의최대; 
==> java 객체로 할당 전달..

 * */
	// 입력값에 의해서 처리한 ArrayList리턴해준다.
	public ArrayList<Product> schList(ProductSch sch){
		ArrayList<Product> list  = new ArrayList<Product>();
		System.out.println("# DB서버에 넘겨줄 검색 데이터 #");
		System.out.println("물건명 키워드:"+sch.getName());
		System.out.println("검색할 가격(최저):"+sch.getFr_price());
		System.out.println("검색할 가격(최대):"+sch.getTo_price());
		System.out.println("# DB 서버에서 온 데이터 리스트 #");
		list.add(new Product("사과",3000,2));
		list.add(new Product("바나나",4000,2));
		list.add(new Product("딸기",12000,3));
		list.add(new Product("오렌지",2000,2));
		for(Product pro:list) {
			System.out.print(pro.getName()+"\t");
			System.out.print(pro.getPrice()+"\t");
			System.out.print(pro.getCnt()+"\t");
		}
		return list;
	} 
	
}
