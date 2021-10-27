package javaexp.a09_api;

import java.util.ArrayList;

public class A14_WrapperExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * ex1) args 래퍼클래스 처리 응용예제 홍길동 25 75.7 값을 받아서 wrapper 클래스에 해당하는 데이터를 할당하여 이름
		 * : @@ 나이 : @@ 몸무게 : @@@ [5조], 6조에서 해당 문제 정답 제출 못하신분들 전송해주세요
		 */
		String name = new String(args[0]);
		Integer age = Integer.parseInt(args[1]);
		Double weight = Double.parseDouble(args[2]);
		System.out.println("이름: " + name);
		System.out.println("나이: " + age);
		System.out.println("몸무게: " + weight);
		/*
		 * ex2) ArrayList로 Autoboxing 처리 데이터 할당하기.. ArrayList<String> : 이름
		 * ArrayList<Integer> : 번호 ArrayList<Double> : 점수평균(소숫점한자리) 3명의 정보를 각각 할당하여 출력처리
		 * 하세요. [4조]
		 */
		ArrayList<String> slist = new ArrayList<String>();
		slist.add("홍길동");
		slist.add("신길동");
		slist.add("마길동");
		ArrayList<Integer> ilist01 = new ArrayList<Integer>();
		ilist01.add(1);
		ilist01.add(2);
		ilist01.add(3);
		ArrayList<Double> dlist = new ArrayList<Double>();
		dlist.add(90.5);
		dlist.add(88.7);
		dlist.add(80.9);
		System.out.println("번호\t이름\t평균");
		for (int idx = 0; idx < 3; idx++) {
			System.out.print(ilist01.get(idx) + "\t");
			System.out.print(slist.get(idx) + "\t");
			System.out.println(dlist.get(idx));
		}

	}

}
