package javaexp.a01_basic;

/*
 	1. 최상단에 소속되어 있는 package 단위를 선언.
 	2. 사용하게 될 외부패키지의 클래스 선언
		ex) import @@@.@@@;
 	3. class 선언.
		접근제어자 class 클래스명 {사용할 중괄호 블럭범위}
		1) 코드를 정리할 때 반드시 포함되어 있는 계층구조를 명확히 해야 한다.
			==> 가독성(코드를 읽고 해석하는 능력)이 높아진다.
*/

public class A03_Person {
	// 하위에 소속된 block(중괄호)는 탭 간격을 통해 적절하게 하위에 소속된 것이라고 표기해야 가독성이 높아진다.
	// ctrl + shift + f : 블럭단위로 소스 자동 정리
	void call() {

		if (true) {

		}
		for (;;) {
			if (true) {

			}
		}
	}
}