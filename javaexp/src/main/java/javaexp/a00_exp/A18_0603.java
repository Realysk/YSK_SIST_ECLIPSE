package javaexp.a00_exp;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javaexp.z01_vo.Food;

public class A18_0603 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # 0603 정리문제 #
			1. autoboxing이란 무엇을 말하는지 예제 2가지를 기술해보세요.
			
				autoboxing : Boxing과 Unboxing 외에 보다 더 간편한 코딩이 가능한 것을 의미한다.
				
				*/
					Character obj06 = new Character('A');
					Boolean obj07 = new Boolean("true");
					// autoboxing 처리
					Float obj08 = 35.5F;
					System.out.println("obj06 : " + obj06);
					System.out.println("obj07 : " + obj07);
					System.out.println("obj08 : " + obj08);
				/*
			
			2. 학생 5명의 이름과 국어, 영어, 수학 성적(0~100임의)으로 autoboxing으로 입력하고 리스트 출력 처리하세요.
			
				*/
					ArrayList<String> names = new ArrayList<String>();
					ArrayList<Integer> kors = new ArrayList<Integer>();
					ArrayList<Integer> engs = new ArrayList<Integer>();
					ArrayList<Integer> maths = new ArrayList<Integer>();
					String []narry = {"홍길동", "김길동", "신길동", "마길동", "오길동"};
					// Math.random()*101 : 1~100 100가지,
					// 0~100 101가지
					System.out.println("번호\t이름\t국어\t영어\t수학\t총계");
					for(int idx=0; idx<narry.length; idx++) {
						names.add(narry[idx]);
						// boxing으로 Integer i = 숫자값
						kors.add((int)(Math.random()*101));
						engs.add((int)(Math.random()*101));
						maths.add((int)(Math.random()*101));
						System.out.print(idx + 1 + "\t");
						System.out.print(names.get(idx) + "\t");
						System.out.print(kors.get(idx) + "\t");
						System.out.print(engs.get(idx) + "\t");
						System.out.print(maths.get(idx) + "\t");
						// unboxing 후 연산
						// Wrapper에 있는 객체를 기본유형으로 자동 unboxing으로 처리되어 연상 후 할당
						int tot = kors.get(idx) + engs.get(idx) + maths.get(idx);
						System.out.print(tot + "\n");
					}
				/*
			
			3. 임의의 범위를 1000.01 ~ 9999.99 로 설정하여 데이터를 출력하고, 올림/내림/반올림 처리한 결과를 룰력하세요.
				
				100001 ~ 999999
				(int)(Math.random()*경우의수 + 시작수)
			=>	ex)	경우의 수
				 		1~9:9가지
				 		11~99:89가지
				 		101~999:899가지
				 		100001~999999:899999가지
				 	시작 수 : 100001
				 		
				 	(int)(Math.random()*899999+100001))/100.0;
				 	정수/정수 => 정수
				 	정수/실수 => 실수
				 		
				*/
					double ran = ((int)(Math.random()*899999+100001))/100.0;
					System.out.println("랜덤 수 : " + ran);
					System.out.println("올림 : " + Math.ceil(ran));
					System.out.println("내림 : " + Math.floor(ran));
					System.out.println("반올림 : " + Math.round(ran));
				/*
			
			4. Random 객체를 활용하여 주사위 2개의 합산을 나타내세요.
			
				*/
					Random rd = new Random();
					// rd.nextInt(경우의수) + 시작수
					int dice1 = rd.nextInt(6) + 1;
					int dice2 = rd.nextInt(6) + 1;
					System.out.println("주사위 1 : " + dice1);
					System.out.println("주사위 2 : " + dice2);
					System.out.println("주사위 합산 : " + (dice1+dice2));
				/*
			
			5. Class 객체의 생성방법 2가지를 기술하세요.
			
				*/
//					1) 선언한 객체 생성 후 사용
					Food f1 = new Food();
					// 해당 객체의 메타 정보(객체 / 클래스정보 - 생성자, 메서드, 필드등의 정보)를 가져오기 위한 객체 Class
					// JVM 메모리에 로딩
					Class clazz1 = f1.getClass();
//					2) 해당 패키지명과 클래스명을 이용하여 가져오는 방법
					try {
						// 특정 문자열로 된 클래스명이 JVM 메모리에 로딩이 되기 때문에 필수 예외 처리가 필요하다.
						Class clazz2 = Class.forName("javaexp.z01_vo.Product");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	
				/*
			
			6. List의 공통메서드와  하위 실제클래스의 특징을 기술하세요.
				
				1) 공통메서드
					add() : 마지막에 추가
					add(위치, 추가객체) : 특정 위치에 추가
					set(위치, 변경할객체) : 특정 위치로 변경
					get(위치) : 특정 위치에 있는 단위 객체 가져오기
					remove(위치) : 특정 위치에 있는 단위 객체 List에서 삭제
					remove(객체) : List 안에 있는 특정 객체 삭제
					contains(객체) : List 안에 특정 객체가 있는지 여부
						boolean으로 리턴
					isEmpty() : List 안에 객체가 있는지 여부 boolean 리턴
					size() : 저장되어 있는 객체의 갯수를 리턴
				
				2) 하위 실제클래스
					ArrayList : 가장 일반적으로 사용되는 클래스
					Vector : 쓰레드에서 데이터의 입력/수정/삭제를 안정적으로 처리한다. (동기화처리를 해준다.)
					LinkedList : 인접 참조를 링크에서 Chaining 관리, 특정 index에서 객체를 제거하거나 추가하게 되면
								앞뒤 링크만 변경하기 때문에 빈번한 객체 삽입/삭제 시 효율적으로 활용된다.
					
			7. LinkedList를 이용해서, 구매물품을 추가,수정,삭제를 처리하세요.
			
				*/
					List<String> jlist = new LinkedList<String>();
					jlist.add("핸드폰케이스");			
					jlist.add("스틸 반지");	
					jlist.add("야구 점퍼");
					System.out.println("\n# MARPPLE 장바구니 #\n");
					System.out.println("장바구니 목록 : " + jlist + "\n" + "장바구니 상품 수량 : " + jlist.size());
					jlist.add(3, "7부 반팔 티셔츠");
					System.out.println("장바구니 상품 등록 : " + jlist.get(3));
					System.out.println(jlist);
					System.out.println(jlist.get(0) + " 상품을 삭제합니다.");
					jlist.remove(0);
					System.out.println("장바구니 목록 : " + jlist);
					System.out.println("장바구니 상품을 전체 삭제합니다.");
					jlist.clear();
					System.out.println("장바구니 목록 : " + jlist);
				/*
			
		 */

	}

}
