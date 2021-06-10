package javaexp.a09_api;

public class A09_StringBuffer {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		# StringBuffer
			1. 문자열은 추가적으로 +=로 처리할 시, 해당 문자열은 같은 메모리에서 데이터를 추가하는 것이 아니라
				계속 새로운 heap영역의 메모리를 만들어가기 때문에 메모리의 비효율과 부하를 발생시킨다.
				
			2. 문자열에 대한 하나의 메모리에 효과적인 추가 처리를 위해서 사용되는 객체가 StringBuffer이다.
				1) 추가하는 기능 메서드 .append()를 통해서 동일한 heap메모리를 사용하여 메모리 관리를 효율적으로 처리한다.
				2) 주요 기능 메서드
					.append("마지막에 추가할 문자열")
					.insert(특정위치 index, "추가할 문자열")
					.delete(시작index, 마지막index) : 해당 위치에 있는 데이터를 삭제
					.replace(위치index, 위치index, "대체할문자열")
		 */
		
		String name = "홍길동";
		// 기존 name의 heap메모리에 추가적인 데이터를 처리하는 것이 아니라,
		name += ", 김길동";
		// 새로운 메모리가 만들어진다.
		StringBuffer sbf = new StringBuffer("안녕하세요!");
		sbf.append("좋은 하루입니다!!");
		sbf.append("반가워요!!!");
		sbf.insert(6, "문자열 삽입!!");
		sbf.delete(12,19);
		sbf.replace(0, 6, "^^(변경처리)");
		System.out.println(sbf.toString());
		
		/*
		 ex) 초기에 # 과일 목록 입니다 # 문자열 만들고
		 	1) 사과, 바나나, 딸기 추가
		 	2) 바나나 위치 index 확인해서 삭제
		 	3) 딸기 index 확인해서 오렌지로 변경
		 */
		
		StringBuffer sbf2 = new StringBuffer("# 과일 목록 입니다. # \n");
		sbf2.append("사과, 바나나, 딸기");
		System.out.println(sbf2.toString());
		sbf2.delete(17,21);
		System.out.println(sbf2.toString());
		sbf2.replace(17,sbf2.length(),"오렌지");
		System.out.println(sbf2.toString());
	}
}
