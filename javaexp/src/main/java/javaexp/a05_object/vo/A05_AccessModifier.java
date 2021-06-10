package javaexp.a05_object.vo;

import javaexp.a05_object.Z01_Person;

public class A05_AccessModifier {

	public static void main(String[] args) {
			// TODO Auto-generated method stub
			Z01_Person p01 = new Z01_Person();
//			System.out.println(p01.name);
//			접근제어자가 private는 외부 클래스에서 호출해서 사용할 수 없다.

//			상단에 선언안 패키지명이 같기 때문에 접근이 가능하다.
//			System.out.println(p01.address);
//			상속관계가 없기 때문에 에러 발생
//			System.out.println(p01.inherit);
//			announce는 public이기에 접근이 가능하다.
			System.out.println(p01.announce);
		}
	}
