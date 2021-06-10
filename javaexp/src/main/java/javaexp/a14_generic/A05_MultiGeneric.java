package javaexp.a14_generic;

import javaexp.z01_vo.Product;

public class A05_MultiGeneric {

	public static void main(String[] args) {

		// TODO Auto-generated method stub
/*
# generic을 활용하여 가변적인 여러 객체의 속성 설정하여 처리하기
	1. 형식
		class 클래스명<K,V>{
			private K key;
			private V value;
		}
		위와 같이 두가지 이상의 속성을 가변적으로 객체로 사용해서 활용할 수 있다.
		호출할 시 클래스명<사용할타입1, 사용할타입2> 참조;
		ex) Pair<Integer, String> 
				p01
 */
		
		Pair<Integer, String> 
			p01 = new Pair<Integer,String>(1,"사과");
		Pair<Integer, String> 
			p02 = new Pair<Integer,String>(2,"바나나");
		System.out.println(p01.getKey()+":"+p01.getValue());
		System.out.println(p02.getKey()+":"+p02.getValue());
		Pair<Integer, Product>
			p03 = new Pair<Integer, Product>(
					3,new Product("오렌지",4000,2));
		System.out.println(p03.getKey());
		// value로 객체가 할당 되어있기에 객체를 가져올 수 있다.
		Product pro = p03.getValue();
		System.out.println(pro.getName());
//	ex) OracleInfo<String,String>으로 처리할 수 있게
//		generic 객체를 선언하여, 아래 유형의 값을 할당하고 출력할 수
//		있게 하세요..
/*
		driver=oracle.jdbc.OracleDriver
				url=jdbc:oracle:thin:@localhost:1521:orcl
				username=scott
				password=tiger
*/		
		OracleInfo<String, String> of1 = 
			new OracleInfo<String, String>(
					"driver","oracle.jdbc.OracleDriver");
		OracleInfo<String, String> of2 = 
				new OracleInfo<String, String>(
						"url","jdbc:oracle:thin:@localhost:1521:orcl");
		OracleInfo<String, String> of3 = 
				new OracleInfo<String, String>(
						"username","scott");
		OracleInfo<String, String> of4 = 
				new OracleInfo<String, String>(
						"password","tiger");
		System.out.println(of1.getK()+"-"+of1.getV());
		System.out.println(of2.getK()+"-"+of2.getV());
		System.out.println(of3.getK()+"-"+of3.getV());
/*
//ex) 팀명,선수,기록를 할당할 수 있게 처리하세요
class BaseBall<T,P,R>{
	
}
 * */	
		BaseBall<String, String, String> 
			b1 = new BaseBall<String, String, String>(
					"두산","홍길동","승");
		BaseBall<String, String, Double> 
			b2 = new BaseBall<String, String, Double>(
				"LG","홍길동",0.301);
		BaseBall<String, String, Integer> 
			b3 = new BaseBall<String, String, Integer>(
				"삼성","마길동",30);	
		System.out.println(b1.getTeam()+"\t"+b1.getPlayer()+"\t"+b1.getRecord());
		System.out.println(b2.getTeam()+"\t"+b2.getPlayer()+"\t"+b2.getRecord());
		System.out.println(b3.getTeam()+"\t"+b3.getPlayer()+"\t"+b3.getRecord());
		
	}

}
class BaseBall<T,P,R>{
	T team;
	P player;
	R record;
	public BaseBall(T team, P player, R record) {
		super();
		this.team = team;
		this.player = player;
		this.record = record;
	}
	public T getTeam() {
		return team;
	}
	public void setTeam(T team) {
		this.team = team;
	}
	public P getPlayer() {
		return player;
	}
	public void setPlayer(P player) {
		this.player = player;
	}
	public R getRecord() {
		return record;
	}
	public void setRecord(R record) {
		this.record = record;
	}
	
}

class OracleInfo<K,V>{
	private K k;
	private V v;
	public OracleInfo(K k, V v) {
		this.k = k;
		this.v = v;
	}
	public K getK() {
		return k;
	}
	public void setK(K k) {
		this.k = k;
	}
	public V getV() {
		return v;
	}
	public void setV(V v) {
		this.v = v;
	}
	
}

class Pair<K,V>{
	private K key;
	private V value;
	public Pair(K key, V value) {
		super();
		this.key = key;
		this.value = value;
	}
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
	
}
