package javaexp.a05_object.vo;

// VO(value object)
// 클래스를 선언하고, 외부/내부 패키지 접근하여 
// 데이터로 사용할 때, 활용한다.
public class Student {
// 1. 필드 : private로 일반적으로 선언한다.
	private String name;
	private int kor;
	private int eng;
	private int math;
// 2. 생성자 : 매개변수없는 생성자.
//    필요한 초기값이 있는 생성자 선언.
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Student(String name) {
		super();
		this.name = name;
	}
	public Student(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}
// 3. 간접적으로 필드를 접근할 수 있게 setXXX, getXXX
	
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
// 4. 추가적인 기능 메서드 선언.
//	  1) toString() : 객체를 생성해서 참조변수만 호출하였을 때,
//	 	 default로 나타날 리턴값을 선언한다.
//	     ex) Student st1 = new Student();
//			 System.out.println(st1);
	@Override
	public String toString() {
		return super.toString()+":Student [name=" + name + ", kor="
				+ kor + ", eng=" + eng + ", math=" + math + "]";
	}
	
	public static void main(String args[]) {
		Student st1 = new Student("홍길동",80,90,70);
		System.out.println(st1);
	}
	// ex) Product2.java 로 선언하여, 물건명 가격 갯수를 필드를
	//     처리하되, toString()에는 해당 필드와 계까지 리턴하여
	///    선언되게 하고, 참조변수로 해당 내용을 출력해보세요.[6조]
	
}
