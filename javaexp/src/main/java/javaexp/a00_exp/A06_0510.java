package javaexp.a00_exp;

import java.util.Calendar;

public class A06_0510 {

	public enum Cards{하트, 스페이드, 클로버, 다이아몬드};
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 	1. Math.random()을 이용하여 다양한 임의의 경우를 추출하고자 한다.
		 		기본형식을 정리하고, 사원번호 1000~1020번까지 임의로 청팀/홍팀을 배정하여 아래와 같이 출력하세요. (for문 활용)
		 		1000	청팀
		 		1001	청팀
		 		1002	홍팀
		 		1) 1단계		1000	0
		 					1001	0
		 					1002	1
		 		*/
					// (int)(Math.random() * 경우의 수 + 시작 수)
					// (int)(Math.random() * 경우의 수) : 배열의 데이터와 연결된 내용을 호출하는 경우, 배열의 갯수를 경우의 수로 설정한다.
					String [] tname = {"청팀","홍팀"};
					System.out.println("사원번호\t팀");
					for(int empno = 1000; empno <= 1020; empno++) {
						// tname.length : 배열의 갯수를 경우의 수로 사용하면 배열에 있는 index를 임의로 가져와 처리 된다.
						int tIdx = (int)(Math.random() * tname.length);
						System.out.print(empno + "\t");
						System.out.println(tname[tIdx]);
					}
				/*
				 
		 	2. 반 학생 1~30번의 점수를 0~100까지 임의로 나오게 하고, 평균점수를 정수로 출력하세요.
		 		알고리즘) 최고/최저/평균
		 		hint) int max = 0; int min = 0;
		 				if (max < point) max = point;
		 				if (max > point) min = point;
		 		*/
					System.out.println("번호\t점수");
					int tot = 0;
					for(int no = 1; no <= 30; no++) {
						// 0~100까지는 경우의 수가 101가지
						int point = (int)(Math.random() * 101);
						System.out.println(no + "\t" + point);
						// tot = tot + point; // 누적 처리
						tot += point; // 누적 처리
					}
					System.out.println("총계 : " + tot);
					System.out.println("평균 : " + (tot/30));
		 		/*
		 		 
		 	3. Calendar 객체의 생성의 기본 형식과 주요 상수를 정리하고, 오늘과 이번달 임의의 날짜와의 차이를 출력하세요.
		 		객체 생성 : Calendar cal = Calendar.getInstance();
		 		연도 : Calendar.YEAR
		 		월 : Calendar.MONTH
		 		일 : Calendar.DAY_OF_MONTH
		 		요일 : Calendar.DAY_OF_WEEK
		 		시 : Calendar.HOUR_OF_DAY
		 		분 : Calendar.MINUTE
		 		초 : Calendar.SECOND
		 		각 데이터는 cal.get(상수);
		 		
		 		*/
					Calendar today = Calendar.getInstance();
					int year = today.get(Calendar.YEAR);
					int month = today.get(Calendar.MONTH)+1;
					int date = today.get(Calendar.DAY_OF_MONTH);
					System.out.println("# 오늘 정보 #");					
					System.out.println(year + "/" + month + "/" + date);		
					Calendar ranCal = Calendar.getInstance();
					int year1 = today.get(Calendar.YEAR);
					int month1 = today.get(Calendar.MONTH)+1;
					// 임의의 날짜 설정
					int ranDate = (int)(Math.random() * 31 + 1);
					// 캘린더참조.set(변경할상수,변경할데이터)
					ranCal.set(Calendar.DAY_OF_MONTH, ranDate);
					int date1 = ranCal.get(Calendar.DAY_OF_MONTH);
					System.out.println(year1 + "/" + month1 + "/" + date1);	
					System.out.println("오늘과의 차이 : " + (date1-date) + "일");	
		 		/*
		 		 
		 	4. enum 상수의 주요 속성을 기술하고, cards의 종류 4가지 (하트, 스페이스, 크로바, 다이아몬드)를 설정하여 4가지 카드 중 임의로 선택하여 출력하세요.
		 		.values() : 배열로 enum의 상수를 가져온다.
		 		.name() : 저장된 enum의 값
		 		.ordinal() : 저장된 enum의 index(0~~) 순서
		 		
		 		*/
					int cIdx = (int)(Math.random() * 4);
					Cards[] cards = Cards.values();
					System.out.println("# 임의의 카드 #");
					System.out.println(cards[cIdx]);
				/*
		 		
		 		
		 	5. 객체형 배열의 생성 기본 형식을 기술하고, Student 객체에 이름 국어 영어 수학 속성을 설정하여 3명의 총점과 평균을 forEach구문을 통해서 출력하세요.
		 	
		 		*/
					Student[] studs = new Student[3];
					String names[] = {"홍길동", "신길동", "김길동"};
					System.out.println("이름\t국어\t영어\t수학\t총점\t평균");
					for(int idx = 0; idx < studs.length; idx++) {
						int kor = (int)(Math.random()*101);
						int eng = (int)(Math.random()*101);
						int math = (int)(Math.random()*101);
						// 배열의 데이터에 객체를 생성하고, 데이터를 입력하면서 처리.
						studs[idx] = new Student(names[idx],kor,eng,math);
						System.out.print(studs[idx].getName() + "\t");
						System.out.print(studs[idx].getKor() + "\t");
						System.out.print(studs[idx].getEng() + "\t");
						System.out.print(studs[idx].getMath() + "\t");
						int sum = studs[idx].getKor() + studs[idx].getEng() + studs[idx].getMath();
						System.out.print(sum + "\t");
						System.out.print(sum/3.0 + "\n");
					}
				/*
		 	
		 	
		 	
		 */

	}

}

class Student {
	private String name;
	private int kor;
	private int eng;
	private int math;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}

}
