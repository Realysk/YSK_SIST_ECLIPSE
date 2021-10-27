package javaexp.a00_exp.a05;

import java.util.ArrayList;

class Person01{
	public String toString() {
		return super.toString()+":재정의한 내용 리턴!!!";
	}
}
public class A15_0527 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Object o = new Object();
		System.out.println(o);
		System.out.println(o.toString());
		Person01 p01 = new Person01();
		System.out.println(p01);
/*
# 정리문제
1. 클래스 선언에서 toString()의 역할을 기술하고. super.toString()을 선언하였을 때,
    어떤 기능이 처리되는지 설명하세요.
    toString() : 모든 객체의 패키지명.클래스명@주소값으로 참조변수만 선언하여도
    	해당 내용에 대한 부분을 출력하게 정의해 놓았다.
    
    toString() 내용을 재정의하면 해당 내용을 참조변수출력만으로 확인할 수 있다.
    super.toString()을 호출하면, Object에서 선언한 내용인 패키지명.클래스명@주소값
    	을 가져올 수 있다.
    
2. 상속관계에서 super키워드를 사용하는 경우를 예제와 함께 기술하세요.
	1) 상속관계 재정의 메서드가 있을 때, 상위 메서드와 현재 메서드를 구분하기 위하여
		사용한다.
		class Father{
			private String name;
			Father(String name){
				this.name = name;
			}
			public void gogo(){
				System.out.println("가다");
			}
		}
		class Son extends Father{
			Son(String name){
				super(name+"(아들)");
			}
			public void gogo(){
				System.out.println("빠르게!!");
				super.gogo(); // 부모클래스의 gogo()메서드 호출.
				
			}
		}
	2) 상위에 선언한 사용자정의 생성자를 하위 클래스에서 반드시 호출해야 하는
		경우 super(매개변수값) 형태로 생성자 선언의 1번째라인에서 선언한다.
		


3. Worker 추상 클래스를 상속받은 FireMan, PoliceMan, Programmer를 다형성을 
처리하되, 생성자에 super("경찰과") 활용, 
공통메시드 : 출근/퇴근하다, 재정의 메서드 일하다를 처리하세요. 
1:1, 1:다 관계를 설정하여 처리하세요.
*/ 
		// 상위 = 하위
		Worker01 w1 = new FireMan01();
		w1.goWork();
		w1.working();
		w1.goHome();
		System.out.println("# 1:다 관계 처리 #");
		ArrayList<Worker01> wlist = new ArrayList<Worker01>();
		wlist.add(new PoliceMan01());
		wlist.add(new Programmer01());
		for(Worker01 worker:wlist) {
			worker.goWork();
			worker.working();
			worker.goHome();
		}
		
		/*
4. 오라클 설치과정과 설치에 필요한 내용을 기술하세요.
	1) client(DB클라이언트) <----> server(DB서버)
		# oracle xe 11g : 
		- client : sqlplus
		- server 지원
		# eclipse에서 지원하는 plugin : dbeaver(client 툴)
	2) 설치과정
		# oracle 사이트
			server : 
			xe : 교육용 연습용 버젼..
				setup.exe 설치/삭제 가능
		# 비밀번호
			관리자(admin) system : 계정생성/여러가지 권한 부여 등의 권한을 가지고 이
				1111 
				system/1111
				con system/111
		# 연습용 계정과 연습용 db	
			C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\scott.sql
			cmd 명령을 통해 로딩되는 기본 위치에
			scott.sql 파일을 복사하고,
			비밀번호 정보 대문자에서 소문자로 2군데 변경.
			GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO SCOTT IDENTIFIED BY tiger;
		    CONNECT SCOTT/tiger
		    cmd 창에서
		    sqlplus로 기본 client 서버에 접속
		    admin계정인 system/1111 접속하여
		    현재 폴드에 있는 scott.sql 파일을
		    @(run :실행)scott.sql 통해서 계정생성과 샘플 테이블 생성 데이터 입력 처리
		    @scott.sql

		    
		# jdbc driver 설정.
		    jdbc driver : db 서버에 접속할 때, 필요하는 프로그램 모듈을
		    	자바로 만들어서 처리한 class의 압축판.
		    	각 DB 서버회사에서는 이러한 프로그램을 지원한다. @@.jar
		    	ex) oracle, ms sql, mysql....
		  	1) 활용
		  		client 툴 : dbeaver, sql developer 
		  		프로그래밍에 설정(반드시***)
		  	2) 위치
				C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
					ojdbc6.jar	
			3) client 툴인 dbeaver에서 사용하기 위하여 설정.
			
		# client툴 dbeaver 설치
		    eclipse 상단 메뉴 help ==> eclipse marketplace를 통해서
		    deaver 검색
		    dbeaver 21.0.5 install
		    0) 툴설치 후, open perspective 설정 dbeaver 클릭.
		    1) 상단 메뉴에 데이터베이스 ==> driver 관리자
		    	==> oracle (edit 버튼 클릭)
		    	==> 2번째 탭 libraries에서 jdbc 드라이버를 
		    		설정 처리. add file을 통해
		    		C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
		    		경로에 jdbc.jar 파일 설정 처리..
		    	
		     
		    2) 상단 메뉴 데이터베이스 ==> 새 데이터베이스 연결
		    	프로그램 연결..
		    	host : ip - localhost(현재 컴퓨터에 서버가 설치되어 있을 때)
		    	port - 1521
		    	sid - xe
		    	계정 - scott
		    	비번 - tiger
		    	test 연결 확인
		    3) perspective dbeaver를 선택한 후,
		    	왼쪽 목록에 연결된 DB 정보를 확인
		    4) sql편집기 ==> 새 sql편집기
		    		   
		     			
		    
				
			
			
	
		
		


 
 */
	}

}
abstract class Worker01{
	private String kind;
	public Worker01(String kind) { 
		// 하위 클래스에서 반드시 생성자 호출하여야 한다.(컴파일에러)
		super();
		this.kind = kind;
	}
	// 1. 추상메서드가 1개라도 있으면 추상클래스로 선언하여야 한다.
	// 2. 추상메서드는 상속받는 하위 클래스에서 반드시 재정의하여야 한다.(컴파일에러)
	public abstract void working();
	public String getKind() {
		return kind;
	}
	public void goWork() {
		System.out.println(kind+ " 출근하다");
	}
	public void goHome() {
		System.out.println(kind+ " 퇴근하다");
	}	
}
class FireMan01 extends Worker01{
	public FireMan01() {
		super("소방관");
		// TODO Auto-generated constructor stub
	}
	@Override
	public void working() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"이 불을 끄다!!!");
	}	
}
class PoliceMan01 extends Worker01{
	public PoliceMan01() {
		super("경찰관");
		// TODO Auto-generated constructor stub
	}
	@Override
	public void working() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"이 치안을 유지하다!!!");
	}	
}
class Programmer01 extends Worker01{
	public Programmer01() {
		super("개발자");
		// TODO Auto-generated constructor stub
	}
	@Override
	public void working() {
		// TODO Auto-generated method stub
		System.out.println(getKind()+"가 소프트웨어를 개발하다!!!");
	}	
}





