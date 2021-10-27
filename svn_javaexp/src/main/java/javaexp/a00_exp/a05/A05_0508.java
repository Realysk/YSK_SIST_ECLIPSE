package javaexp.a00_exp.a05;


interface SwimmingWay{
	void swimming();
}

class PoolSwimming implements SwimmingWay{
	@Override
	public void swimming() {
		// TODO Auto-generated method stub
		System.out.println("풀에서 수영을 하다.");
	}
}
class LakeSwimming implements SwimmingWay{
	@Override
	public void swimming() {
		// TODO Auto-generated method stub
		System.out.println("호수에서 수영을 하다.");
	}
}
class SeaSwimming implements SwimmingWay{
	@Override
	public void swimming() {
		// TODO Auto-generated method stub
		System.out.println("바다에서 수영을 하다.");
	}
}
class Duck01{
	private String kind;
	private SwimmingWay swimmingway;
	public Duck01(String kind) {
		this.kind = kind;
	}
	
	public void setSwimmingWay(SwimmingWay swimmingway) {
		this.swimmingway = swimmingway;
	}
	public void swimming() {
		System.out.println(kind+" 오리가!!!");
		if(swimmingway!=null) {
			swimmingway.swimming();
		}else {
			System.out.println("수영을 할 수 없다.");
		}
	}
	
	
}
public class A05_0508 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/* 
# 오늘의 정리 : 
끝나기 전까지 완성하신 분들은 바로 제출해 주셔두 되구, 월요일 수업전까지 제출해주세요.
월요일 오전에 풀이하겠습니다.
1. 인터페이스의 기본형식을 기술하세요.
	interface 인터페이스명{
		리턴값 메서드명(); ==> public abstract 리턴값 메서드명();
	}


2. SwimmingWay인터페이스를 선언하고, 하위에 상속받은
 PoolSwimming, LakeSwimming, SeaSwimming 생성하고,
    다형성으로 처리하세요.
    */
		SwimmingWay sw1 = new PoolSwimming();
		SwimmingWay sw2 = new LakeSwimming();
		SwimmingWay sw3 = new SeaSwimming();		
		/*
3. Duck 클래스를 만들고, 위에 선언한 SwimmingWay 필드와 할당하는 기능메서드를 선언하여,
    swimming() 메서드에 따라서 해당 기능이 다르게 처리되는 것을 구현하세요.
    */
		Duck01 d1 = new Duck01("집");
		d1.setSwimmingWay(new PoolSwimming());
		d1.swimming();
		Duck01 d2 = new Duck01("청둥");
		d2.setSwimmingWay(new LakeSwimming());
		d2.swimming();
		
	/*
    
4. 예외 처리를 하는 목적과 기본형식을 기술하세요.
	프로그래밍에 있어서 에러가 예상되고, 해당 에러를 발생하더라도,
	정상적으로 프로세스를 진행하기 위해서 예외 처리를 한다.
	try{
		// 에러가 발생할 가망성이 있는 코드
	}catch(예외하위클래스 e){
	
	}catch(Exception e){
	
	}finally{
		// 예외 상관 없이 처리할 코드.
	}


5. 아무 설정 없이 args[0]을 호출하면 에러가 발생한다. 오늘 배운 예외 처리 순서를 기술하고,
    이러한 예러가 발생하더라도 정상적으로 프로그램이 수행되도록 예외 처리를 하세요.
*/
		try {
			System.out.println(args[0]);
		}catch(ArrayIndexOutOfBoundsException ae) {
			System.out.println(ae.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			System.out.println("예외 상관없이 처리할 구문");
		}
		
/*
6. String에 데이터를 바로 대입하는 경우와 new String()을 통한 데이터할당의 차이점을 기술하세요.
	String str1 = "홍길동"; 
	"홍길동"이라는 문자열을 가진 변수는 모두가 같은 heap영역의 주소를 사용한다.
	String str2 = new String("홍길동");
	새로운 heap영역의 메모리를 만들어서 문자열을 사용한다.
	str1 == str2 : stack영역의 데이터 즉, 주소값 기준이기 때문에 false가 처리된다.
	str1.equals(str2) : 문자열 자체에 대한 비교이기때문에 true가 처리된다.
	** 문자열에 대한 비교는 .equals()를 활용하자!!

7. 실수형과 정수형 문자열을 실수와 정수로 변환 처리하는 Wrapper클래스의 기능 메서드를 예제를 통해 기술하세요.
	Integer.parseInt("25") ==> 25 숫자로 변환
	Double.parseDouble("73.25") ==> 73.25 숫자로 변환

8. promote와 typecasting이란 무엇인가? 기본예제를 통해서 설명하세요.
*/
		// #데이터 타입의 변경 
		// 1. promote : 작은 유형의 type에서 큰 유형으로 변경.
		int num01 = 25;
		double num02 = num01; // promote가 일어남.
		// 2. casting : 큰 유형의 type에서 작은 유형으로 변경 
		//    데이터의 유실이 일어남..
		//    명시적으로 데이터 유형의 변경..
		double num03 = 34.233;
		int num04 = (int)num03;
		System.out.println("num04:"+num04);
		System.out.println("정수형의 연산:"+(27/4));
		System.out.println("소숫점이하 처리 연산:"+(27/(double)4));
		
/*
9. args를 통해 학생의 성적(국어/영어/수학)을 입력 받았다. 학생의 성적을 출력하세요.
    홍길동 70 80 90 신길동 97 80 95
    평균은 실수로 소숫점이하까지 출력하세요.
    이름 국어 영어 수학 총점 평균
    @@  @@  @@  @@  @@  @@
    @@  @@  @@  @@  @@  @@
    1) 1단계 : 한명만 이름과 점수만 출력
    2) 2단계 : 한명의 총점과 평균출력
*/
	String name1 = args[0];
	int kor1 = Integer.parseInt(args[1]);
	int eng1 = Integer.parseInt(args[2]);
	int math1 = Integer.parseInt(args[3]);
	// println() : 줄바꿈 포함한 출력메서드  "\n"
	// print() : 줄바꿈 포함하지 않은 출력메서드 
	// "\t" : 탭간격을 처리하는 문자열
	System.out.print("이름\t");
	System.out.print("국어\t영어\t수학\t");
	System.out.print("총점\t평균\n");
	int tot1 = kor1+eng1+math1;
	System.out.print(name1+"\t");
	System.out.print(kor1+"\t"+eng1+"\t"+math1+"\t");
	System.out.print(tot1+"\t"+(tot1/(double)3)+"\n");		
		/*    
    3) 3단계 : 두명의 총점과 평균출력
*/
	String name2 = args[4];
	int kor2 = Integer.parseInt(args[5]);
	int eng2 = Integer.parseInt(args[6]);
	int math2 = Integer.parseInt(args[7]);
	int tot2 = kor2+eng2+math2;
	System.out.print(name2+"\t");
	System.out.print(kor2+"\t"+eng2+"\t"+math2+"\t");
	System.out.print(tot2+"\t"+(tot2/3.0)+"\n");		
/*
10. Math.random()과 조건문을 이용하여, 두 개의 팀이 가위/바위/보 게임을 해서 승리여부를 출력하세요
    1) 1단계 : 0,1,2 임의로 출력
    2) 2단계 : 해당 0,1,2가 가위/바위/보로 표현되게 조건문 처리
    3) 3단계 : 두개의 팀에 결과에 따라 조건문으로 승리여부 표현..
 *  */
		// (int)(Math.random()*경우의수 + 시작수);
		int team01 = (int)(Math.random()*3);
		int team02 = (int)(Math.random()*3);
		String []games= {"가위","바위","보"};
		System.out.println("팀1\t팀2");
		System.out.println(game(team01)+"\t"+game(team02));
		// index를 기준으로 배열을 접근하기에 문자열과 연결하여 임의로
		// 출력할 수 있다.
		System.out.println(games[team01]+"\t"+games[team02]);
		System.out.println("결과:\t"+isVic(team01,team02));
	}
	static String game(int idx) {
		String result="";
		if(idx==0) result="가위";
		if(idx==1) result="바위";
		if(idx==2) result="보";
		return result;
	}
	/*
	 0 	1  2
	 가위	바위보	
	 * 
	 * 
	 %3은 각변수 0 1 2 안에 있게 한다.
	 * */	
	static String isVic(int idx1, int idx2) {
		String result="";
		if(idx1==idx2) {
			result="무승부";
		}else if((idx1+1)%3==idx2) {
			result="팀2";
		}else {
			result="팀1";
		}
		return result;
	}		

	


}
