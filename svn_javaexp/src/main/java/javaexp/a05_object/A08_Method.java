package javaexp.a05_object;

public class A08_Method {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Object01 ob1 = new Object01();
		String st1 = ob1.returnExp();
		String st2 = ob1.returnExp();
		System.out.println(st1);
		System.out.println(st2);
		System.out.println(ob1.returnExp());
		System.out.println(ob1.returnExp1());
		System.out.println(ob1.returnExp2());
		System.out.println(ob1.returnExp3());
		System.out.println(ob1.returnExp3());
		System.out.println(ob1.returnExp3());
		System.out.println(ob1.returnExp4());
		System.out.println(ob1.returnExp5());
		double dbl01 = ob1.returnExp5();
		System.out.println("실수를 리턴 받아서 실수변수에 할당:"+dbl01);
		// 배열이 리턴되니 배열에 해당 하는 데이터 type으로 할당하여 사용..
		int [] arr6 = ob1.returnExp6();
		System.out.println(arr6[0]);
		System.out.println(arr6[1]);
		System.out.println(arr6[2]);
		
	}

}
class Object01{
	// 리턴항 유형선언  메서드명(){ return 리턴할 실제데이터;}
	String returnExp() {
		return "안녕하세요";
	}
	String returnExp1() {
		return "안녕하세요";
	}
	String returnExp2() {
		return "반갑습니다";
	}
	char returnExp3() {
		return 'A';
	}
	int returnExp4() {
		int num01 = 3000;
		return num01;
	}
	double returnExp5() {
		double num01 = 25.2;
		double num02 = 30.7; 
		double tot = num01+num02;
		return tot;
	}
	// double num01 = num01+num02;
	int[] returnExp6() {
		int[] arr = {2,3,4};
		return arr;
	}	
	// int[] ret = {2,3,4};
	int[] returnExp7() {
		return new int[] {2,3,4};
	}	
	Person returnexp8() {
		// Person p01 = new Person("홍길동");
		return new Person("홍길동");
	}
	// ex) 아래와 같이 리턴할 데이터를 처리하게끔 기능 메서드를 선언하세요.[4조]
	// returnExp1()  "반갑습니다" 리턴
	// returnExp2()  'A'  
	// returnExp3()  3000
	// returnExp4()	 25.2 + 30.7 
	// returnExp5()  false
	// returnExp6()	 {2,3,4}
	// 
}
