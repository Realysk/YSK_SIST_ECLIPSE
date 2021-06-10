package javaexp.a09_api;

import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class A10_System {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 # System
		 	1. 현재 시스템(서버) 운영체제나 디렉토리에 대한 정보를 가져올 때 활용된다.
		 	2. 지원 메서드
		 		.getProperty("속성")
		 			속성 : os.name, user.name, user.home
		 		.getProperties() : 시스템의 모든 정보들을 Properties 객체로 가져온다.
		 			.keySet() : 해당 내용을 Set 형식의 Key객체들로 가져올 수 있다.
		 */
		
		String osName = System.getProperty("os.name");
		String userName = System.getProperty("user.name");
		String userHome = System.getProperty("user.home");
		System.out.println("# 현재 시스템(운영체제)에 대한 정보 #");
		System.out.println("운영체제 이름 : " + osName);
		System.out.println("사용자 이름 : " + userName);
		System.out.println("사용자 홈 디렉토리 : " + userHome);
		// 전체 속성 가져오기(key, value) 형식으로 저장되어 있음.
		/*
			데이터 처리 구조 가운데
			key1 = value1, key2 = value2, key3 = value3 형식으로 되어 있고 이런 구조를 Map형 구조라고 한다.
			Properties 현재 운영체제에 대한 정보를 key/value형식으로 저장되어 있다.
			System.getProperty("key"); key를 매개변수로 입력하면 해당 기능메서드를 통해서 return값으로 value가 나온다.
			System.getProperties(); 를 통해서 현재 운영체제에 대한 전체 key/value정보를 확인할 수 있는데 이 때 key값 .keySet()를 통해서 전체 키를 가져올 수 있다.
		 */
		Properties props = System.getProperties();
		// keySet() : 가지고 있는 속성의 key를 Set객체로 가져올 수 있다.
		Set keys = props.keySet(); // import 주의 java.util.Set
		
		// [key1, key2, key3......]
		//
		for(Object objKey:keys) {
			// key1 반복을 통해서 배열 형태의 데이터를 하나씩 가져와서
			// 반복문을 통해서 key의 단위 객체를 가져오고
			String key = (String)objKey;
			// System.getProperty(key)를 통해서 value값을 가져올 수 있다.
			// 위 key1에 연결되어 있는 value값을 가져온다.
			String value = System.getProperty(key);
			System.out.println(key + " : " + value);
		}
		
		/*
		 # 환경변수 확인
		 	System.getenv("환경변수의 key")를 통해서 환경변수에 설정 된 값을 가져올 수 있다.
		 */
		
		Map maps = System.getenv();
		String path = System.getenv("Path");
		System.out.println("환경변수 [Path] : " + path);
		
	}
}
