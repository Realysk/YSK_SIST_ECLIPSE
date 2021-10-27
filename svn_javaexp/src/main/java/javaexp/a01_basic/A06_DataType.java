package javaexp.a01_basic;

public class A06_DataType {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
# 기본 데이터 타입
1. 정수, 실수, 문자, 논리, 리터럴(할당되는 실제 상수 데이터)을 직접 저장하는 타입을 말한다.
	25, true, 39.7343 (리터럴상수)
2. 메모리의 최소 기억단위인 bit(0/1)가 8개모여 byte가 형성되어 범위를 설정한다.
3. 유형
	1) 정수형
		byte (1byte) -128~127
		char (2byte) 0~65535  유니코드 문자
			char c1 = 'A';
			char c2 = (char)25;  정수형 25번째 코드값이 c2변수에 할당된다.
		short(2byte) -32768~32767
		**int(4byte) -2147483648 ~ 2147483647
		ex) int num01 = 25;
		long (8byte) 
		ex) long num02 = 25L;
	2) 실수
		float(4byte)
		ex) double num04 = 25.343F;
		**double(8byte)
		ex) double num03 = 25.343;
	3) 논리
		boolean(1byte) true/false
		ex) boolean isPass = true;
		*/
		/*
		for(int code=0;code<=65535;code++) {
			System.out.print(code+":"+(char)code+",");
		}
		*/
// ex) 기본데이터 유형의 이름과 타입 맞게 데이터를 선언과 할당하여 출력하세요.
//		확인 : 연산자를 이용해서 데이터 할당은 어떤 타입부터 가능한지 확인하세요.
//		새로운 조기준 1조분들 실행할 결과 전달 부탁드립니다.
		 byte num01 = 25;
		 num01 = 127; // min/max데이터도 확인..
		 num01 = -128; // min/max데이터도 확인..
		 System.out.println("byte데이터 타입:"+num01);
		 short num02 = 32767;
		 System.out.println("short데이터 타입:"+num02);
		 // 연산식은 int형부터 데이터가 할당된다.
		 char c1 = '안';
		 char c2 = (char)65535;
		 System.out.println(c1+":"+c2);
		 int num03 = num01 + num02;
		 System.out.println("int데이터 타입:"+num03);
		 int num04 = 222222222;
//		 long num05 = 2222222222; // 정수형의 기본 데이터는 int 이기에 할당이 불가능
		 long num06 = 22222222222L;
//		 float num07 = 342.278; // 실수형 기본 데이터는 double이기에 할당이 불가능
		 float num08 = 342.278F; // 실수형 float 데이터 유형은 f로 할당.
		 double num09 = 234.234322222;
		 boolean isPass = num01>num02; // 비교값 처리 가능..
		 System.out.println(num01);
		 System.out.println(num02);
		 System.out.println(num03);
		 System.out.println(num04);
		 System.out.println(num06);
		 System.out.println(num08);
		 System.out.println(num09);
/*    long num04 = 9223372036854775807L; 
      // -9,223,372,036,854,775,808 
      //to 9,223,372,036,854,775,807
      float float01 = 3.48762F; 
      // ±(1.40129846432481707e-45f ~ 3.40282346638528860e+38f)
      double double01 = 9.49201e-32; 
      // ±(4.94065645841246544e-324 ~ 1.79769313486231570e+308) 

 * */		 
		 
		 
		 
		 
		 
		 
		
	}

}
