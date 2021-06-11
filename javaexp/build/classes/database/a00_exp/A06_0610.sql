/*
# 0610 정리문제 #
	1. 명시적 형 변환 함수 3가지를 기본 예제와 함께 기술하세요.
	
	 	1) to_char(문자열) : 숫자/날짜 타입을 문자열로 변환해주는 함수
 		2) to_number(숫자) : 날짜/문자 타입을 숫자로 변환해주는 함수
 		3) to_date(날짜) : 문자/숫자 타입을 날짜로 변환해주는 함수
	
		*/
			SELECT * FROM emp
			WHERE sal >= '2000';
			SELECT * FROM emp
			WHERE sal >= TO_NUMBER('2000');
		
			SELECT ename, hiredate,
			to_char(hiredate,'CC') "세기",
			to_char(hiredate,'YYYY') "년도",			
			to_char(hiredate,'Q') "분기",			
			to_char(hiredate,'MM') "월",			
			to_char(hiredate,'YYYY"년 " MM"월" DD"일"') "날짜표시1",			
			to_char(hiredate,'CC"세기 " WW"째 주" DAY ') "날짜표시2"
			FROM emp;
		
			INSERT INTO emp01(ename,hiredate)
			VALUES('홍길동',to_date('2020-01-02','YYYY-MM-DD'));
			SELECT * FROM emp01;
		/*
	
	2. 문자열 형 변환 format 속성값(날짜, 시간)을 기술하세요.
		
		1) CC : 세기
		2) YYYY/YYY/YY/Y : 년도
		3) AD/A.D : AD/BC
		4) Q : 분기 1 ~ 4
		5) MM/MONTH/MON : 월
		6) WW/W : 연 주 단위 / 월 주 단위
		7) DDD/DD/D : 날짜
		8) DY/DAY : 요일
	
	3. 2/4분기에 입사한 사람을 이름과 분기 입사년월일(YYYY/MM/DD)형식으로 출력하세요.
	
		*/
			SELECT ename, to_char(hiredate, 'YYYY/MM/DD Q"/2"') "입사년월 분기"
			FROM emp
			WHERE to_char(hiredate,'Q') = '1';
		/*
	
	4. decode문의 기본 형식을 기본 예제와 함께 기술하세요.
	
		decode(데이터, case1, case1일 때 처리할 데이터,
 					 case2, case2일 때 처리할 데이터,
 					 case3, case2일 때 처리할 데이터,
 				  위 내용에 해당하지 않을 때 처리할 데이터)
		*/
			SELECT ename, deptno,
			decode(deptno,10,'인사과',
				 		  20,'총무',
						  30,'회계',
				'현재부서없음') 부서명
			FROM emp;
		/*
	
	5. case문의 기본 형식을 기본 예제와 함께 기술하세요.
	
		1) 조건문 형태
 			case when 논리|산술|관계 then 처리할 데이터
 				 when 논리|산술|관계 then 처리할 데이터
 				 else 기타 처리할 데이터
 			end
 			
 		2) switch case문 형태
 			case [컬럼명]
 				when 데이터1 then 처리할 데이터
 				when 데이터2 then 처리할 데이터
 				else 그 외 데이터
 			end
	
		*/
			SELECT ename, deptno,
				CASE WHEN deptno = 10 THEN sal*0.2
		 		 	 WHEN deptno = 20 THEN sal*0.5
		 			 WHEN deptno = 30 THEN sal*0.7
			 		ELSE sal*1.2
				END show
			FROM emp;

			SELECT ename, deptno,
				CASE deptno
					WHEN 10 THEN sal*0.2
		 			WHEN 20 THEN sal*0.5
		 			WHEN 30 THEN sal*0.7
		 			ELSE sal*1.2
				END show
			FROM emp;
		/*
	
	6. nvl, nvl2, nullif 함수의 차이점을 기술하세요.
	
		nvl(데이터, null값일 때 처리할 데이터)
			- 해당 데이터가 null값일 때 처리할 데이터를 설정함으로 null에 대한 연산 처리가 필요하다.
		nvl2(데이터, null이 아닐 때 처리할 데이터, null일 때 처리할 데이터)
		nullif(데이터1, 데이터2)
 			- 두 개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고 동일하지 않으면 첫 번째 데이터1을 반환하는 함수
						
*/