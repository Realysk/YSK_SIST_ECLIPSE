package javaexp.a05_object;

public class A08_Method {
	public static void main(String[] args) {
		Object01 ob1 = new Object01();
		String st1 = ob1.returnExp();
		String st2 = ob1.returnExp();
		String st3 = ob1.returnExp();
		System.out.println(st1);
		System.out.println(st2);
		System.out.println(ob1.returnExp());
		
		Object02 ob2 = new Object02();
		String st4 = ob2.returnExp1();
		char st5 = ob2.returnExp2();
		int st6 = ob2.returnExp3();
		double st7 = ob2.returnExp4();
		boolean st8 = ob2.returnExp5();
		int[] st9 = ob2.returnExp6();
		int[] st10 = ob2.returnExp7();
		System.out.println(ob2.returnExp1());
		System.out.println(st5);
		System.out.println(ob2.returnExp3());
		System.out.println(st7);
		System.out.println(ob2.returnExp5());
		System.out.println(st9);
		System.out.println(st10);
		}
}

class Object01 {
	// 리턴할 유형 선언  메서드명(){return 리턴할 실제데이터;}
	String returnExp() {
		return "안녕하세요";
	}
	
}

/*
ex) 아래와 같이 리턴할 데이터를 처리 하게끔 기능 메서드를 선언하세요.

returnExp1() "반갑습니다" 리턴
returnExp2() 'A'
returnExp3() 3000
returnExp4() 25.2 + 30.7
returnExp5() false
returnExp6() {2,3,4}

*/

class Object02 {
	// 리턴할 유형 선언  메서드명(){return 리턴할 실제데이터;}
	String returnExp1() {
		return "반갑습니다";
	}
	char returnExp2() {
		return 'A';
	}
	int returnExp3() {
		int num01 = 3000;
		return num01;
	}
	double returnExp4() {
		double num01 = 25.2;
		double num02 = 30.7;
		double tot = num01+num02;
		return tot;
	}
	boolean returnExp5() {
		return false;
	}
	// double num01 = num01 + num02;
	int[] returnExp6() {
		int[] arr = {2,3,4};
		return arr;
	}
	// int ret = {2,3,4};
	int[] returnExp7() {
		return new int[] {2,3,4};
	}
	Person returnExp8() {
		return new Person("홍길동");
	}
}