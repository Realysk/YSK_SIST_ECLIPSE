package javaexp.a10_collections;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

public class A06_Properties {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Properties prop = new Properties();
		
		/*
		# Properties
			1. 특정 파일을 호출하여 해당 파일의 내용이 key=value로 되어 있는 경우에 활용한다.
				주로 시스템에 서버 정보나 공통 정보를 파일로 저장했다가 한번에 모든 코드에서 활용할 때 활용된다.
			
			2. getProperty("key") 메서드로 된 내용을 값으로 문자열로 할당하여 가져온다.
			
			3. 기능 메서드
				1) load(new FileReader("파일명/경로명")) 해당 파일을 로딩 처리한다.
				2) getProperty() : key로 설정한 값을 가져온다.
		*/
		
		// 시스템 상 절대경로를 가져온다.
		// * 실행하는 객체를 기준으로 같은 패키지에 설정 파일이 있을 때 해당 파일의 서버상의 접근할 수 있는 절대 위치를 가져온다.
		// 메인클래스명.class.getResource("메인클래스와 같이 있는 파일명").getPath()
		String path = A06_Properties.class.getResource("database.properties").getPath();
		System.out.println("절대경로와 파일명 : " + path);
		try {
			// 경로명이나 파일명에 한글이 포함된 경우 decode처리.
			path = URLDecoder.decode(path, "utf-8");
			// FileReader : Stream 객체 중에 OutputStream 하위 객체로 파일의 내용을 읽을 수 있는 객체.
			// Properties의 기능메서드 load()를 통해서 읽어온다.
			prop.load(new FileReader(path));
			
			/*
			 # Properties 객체의 활용
			 	1. 특정 파일에 key=value형식으로 데이터를 저장한다.
			 	2. FileReader객체를 통해서 해당 파일의 텍스트로 된 정보를 읽어온다.
			 	3. .load()를 통해서 해당 정보를 Properties객체에 할당함으로 key/value 구조를 인식할 수 있게 한다.
			 	4. .getProperty("key")를 통해서 매칭되어 있는 value값을 가져온다.
			 	
			 # 필수 예외 처리
			 	1. IO가 일어나는 경우 반드시 예외 처리를 해야 한다.
			 		- File 관련하여 IO 발생 : FileNotFoundException
			 		- 기본 Stream처리 IO : IOException
			 	2. encoding 처리 시 지정한 encoding을 설정할 수 없을 때 발생하는 예외 처리
			 		: UnsupportedEncodingException
			 */
			
			System.out.println("Driver : " + prop.getProperty("driver"));
			System.out.println("Url : " + prop.getProperty("url"));
			System.out.println("Username : " + prop.getProperty("driver"));
			System.out.println("Password : " + prop.getProperty("driver"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}