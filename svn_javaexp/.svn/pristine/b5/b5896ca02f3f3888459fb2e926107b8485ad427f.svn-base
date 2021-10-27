package javaexp.a09_api;

public class A05_TypeCasting {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
# 숫자형에서 데이터 변환 처리..
1. 숫자형은 종류와 크기에 따라서
	byte, short, int, long (정수형)
	float, double(실수형)
2. 해당 데이터는 작은 데이터 타입에서 큰데이터 타입으로 할당하는
	것을 promote라고 한다.
	데이터 유실이 없다. ex) 작은 용기에 있는 물은 큰 용기에 담는 것.
	큰데이터 타입에 담긴데이터를 작은 데이터타입으로 할당하면 유실이 발생한다.
	이 때, 명시적으로 해당 작은 데이터에 맞게 타입을 정해서 할당할 하는데,
	이것을 casting이라고 한다. (데이터유형)
	ex) 큰 용기에 가득채운 물을 작은 용기에 담으면 넘쳐서 버리게 된다.
3. 자바에서 연산처리 시, 정수형/정수형 ==> 정수형으로 처리된다.
	이때, 소숫점이하까지 처리된 결과를 확인하기 위해, 피연산자의 데이터가
	1개이상 실수이어야 한다.
		*/		
		byte num01 = 25;
		int num02 = num01;
		System.out.println(num02);
		double num03 = num02;
		System.out.println(num03);
		double num04 = 25.343;
		int num05 = (int)num04;
		System.out.println(num05);
		int num06 = 25;
		int num07 = 4;
		
		System.out.println("정수형/정수형:"+num06/num07);
		System.out.println("정수형/실수형:"+num06/(double)num07);
// ex) 실수형변환, 타입캐스팅 이용..
//     args   3명의 몸무게를 입력받아.
//	   실수형의 평균 : @@@		
//     정수형의 평균 : @@@
		double mem01W = Double.parseDouble(args[0]); 
		double mem02W = Double.parseDouble(args[1]); 
		double mem03W = Double.parseDouble(args[2]);
		System.out.println("회원1:"+mem01W+"kg");
		System.out.println("회원2:"+mem02W+"kg");
		System.out.println("회원3:"+mem03W+"kg");
		double avg = (mem01W+mem02W+mem03W)/3;
		System.out.println("평균(실수):"+avg+"kg");
		int mem01Int = (int)mem01W;
		int mem02Int = (int)mem02W;
		int mem03Int = (int)mem03W;
		int avg2 = (mem01Int+mem02Int+mem03Int)/3;
		System.out.println("평균(정수):"+avg2+"kg");
		
		
	}

}
