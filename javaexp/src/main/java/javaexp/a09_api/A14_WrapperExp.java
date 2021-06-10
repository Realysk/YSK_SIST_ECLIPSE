package javaexp.a09_api;

import java.util.ArrayList;

public class A14_WrapperExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 ex1) args 래퍼 클래스 처리 응용 예제
		 	홍길동 25 85.7
		 	값을 받아서 wrapper 클래스에 해당하는 데이터를 할당하여
		 	이름 : @@@
		 	나이 : @@
		 	체중 : @@@
		 */
		
//		String name = new String(args[0]);
//		Integer age = new Integer.parseInt(args[1]);
//		Double weight = new Double.parseInt(args[2]);
//		System.out.println("이름 : " + name);
//		System.out.println("나이 : " + age);
//		System.out.println("체중 : " + weight);
		
		/*
		 ex2) ArrayList로 autoboxing 처리 데이터 할당하기
		 	ArrayList<String> : 이름
		 	ArrayList<Integer> : 번호
		 	ArrayList<Double> : 점수 평균 (소숫점 한자리)
		 	3명의 정보를 각각 할당하여 출력하세요.
		 */
		
		ArrayList<String> slist = new ArrayList<String>();
		slist.add("홍길동");
		slist.add("마길동");
		slist.add("최길동");
		ArrayList<Integer> ilist = new ArrayList<Integer>();
		ilist.add(1);
		ilist.add(2);
		ilist.add(3);
		ArrayList<Double> dlist = new ArrayList<Double>();
		dlist.add(90.5);
		dlist.add(85.5);
		dlist.add(83.5);
		System.out.println("번호\t이름\t평균");
		for (int idx = 0; idx < 3; idx++) {
			System.out.println(ilist.get(idx) + "\t");
			System.out.println(slist.get(idx) + "\t");
			System.out.println(dlist.get(idx) + "\t");
		}

	}

}
