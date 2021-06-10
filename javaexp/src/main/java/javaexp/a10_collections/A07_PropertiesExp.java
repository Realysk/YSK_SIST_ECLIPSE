package javaexp.a10_collections;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

public class A07_PropertiesExp {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 절대 경로 및 파일 정보 가져오기.
		String path = A07_PropertiesExp.class.getResource("member.info").getPath();
		
		/*
		 	cf) 절대 경로 : 시스템 기반으로 파일 정보를 가져올 때 해당 시스템에서 사용하는 파일 시스템 구조에 의해 접근해서 가져올 수 있는 경로 정보.
			# 상대 경로 : 현재 실행 파일의 위치를 기준으로 ../ (상위폴더) / 폴더명 (하위폴더)로 접근하여\ 특정한 파일로 호출하거나 로딩할 때 쓰이는 경로를 말한다.
		 */
		
		System.out.println("member.info의 절대 경로 : " + path);
		/* 
		 	1) 경로명 decoding 처리하기
			cf) encoding/decoding
				영문자는 1byte범위 안에 모든 문자를 표현할 수 있지만 그 외 타국의 문자는 1byte로 표현이 불가능한 것이 많다.
				프로그램과 서버에 따라 차이는 있지만 보통 2byte로 기타 영어를 표현하는 경우가 많다.
				cf) Oracle DB 서버
					한글을 3byte를 잡고 있다.
				IO(input/output)이 일어날 때 기본 시스템의 데이터 전송 단위가 1byte로 처리된다.
				한글을 1byte로 바꿔서 전송 하고 다시 바꾼 1byte를 한글 2byte로 변경하여 처리한다.
				
				한글 encoding : 2byte => 1byte로 변환
				한글 decoding : 1byte => 2byte로 변환
		*/
		
		try {
			path = URLDecoder.decode(path, "UTF-8");
//		2. Properties 객체 생성 

			FileReader fr = new FileReader(path);
//			OutputStream의 하위 객체
		// FileReader : 2byte이상의 한글 내용을 읽어 올 수 있는 객체.
			Properties prop = new Properties();
			prop.load(fr);
			System.out.println("# 저장 된 회원 아이디 #");
			System.out.println("id01 : " + prop.getProperty("id01"));
			System.out.println("id02 : " + prop.getProperty("id02"));
			System.out.println("id03 : " + prop.getProperty("id03"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
