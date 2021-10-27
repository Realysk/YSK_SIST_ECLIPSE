--1. 명시적 형변환 함수 3가지를 기본 예제와 함께 기술하세요.
--2. 문자열 형변환 format 속성값(날짜,시간)을 기술해보세요.
--3. 2/4분기에 입사한 사람을 이름과 분기 입사년월일(YYYY/MM/DD)형식으로 출력하세요.
--4. decode문의 기본형식을 기본예제와 함께 기술하세요.
--5. case문의 기본형식을 기본예제와 함께 기술하세요.
--6. nvl, nvl2, nullif 함수의 차이점을 기술하세요. 


# 전날 정리 문제
1. 명시적 형변환 함수 3가지를 기본 예제와 함께 기술하세요.
		1) to_char(문자열로,'형식') :  숫자/날짜 타입을 문자열로 변환해주는 함수이다.
		2) to_number(숫자로) : 날짜/문자 타입을 숫자로 변환해주는 함수
		3) to_date(날짜로,'형식') : 문자/숫자 타입을 날짜로 변환해주는 함수


2. 문자열 형변환 format 속성값(날짜,시간)을 기술해보세요.
   # 날짜형을 문자열로 표현하는 출력형식
	1) CC :세기
	2) YYYY/YYY/YY/Y :년도표기
	3) AD/A.D : AD/BC표기
	4) Q : 분기 1~4
	5) MM/MONTH/MON : 월표기
	6) WW/W : 연을 주간위로 표기/월을 주단위로 표기.
	7) DDD/DD/D :날짜 표기
	8) DY/DAY :요일 표기
   # date타입의 시간 표시 형식
	1) AM/PM :오전/오후 시간 표시
	2) A.M/P.M : 오전/오후 시각 표시
	3) HH/HH12 : 시각(1~12) 표시
	4) HH24 : 24시간(0~23) 표시
	5) MI : 분
	6) SS : 초
  # 숫자형 데이터를 문자열 형식으로 변환 처리..
	1) 기본형식 to_char(숫자형데이터,'형식')
	2) 주요형식
		해당자리수 이상의 데이터가 처리 될 때는 ###으로 표기된다.
		9999 : 기본 자리수에 맞게 처리.
		0000 : 해당 자리수이하 일때 0으로 채워짐
		$ : 앞에 $표기 처리..
		. : 특정한 자리를 표기 소수점
		, : x특정한 위치에 ,를 표기.(천단위표시)

3. 2/4분기에 입사한 사람을 이름과 분기 입사년월일(YYYY/MM/DD)형식으로 출력하세요.
SELECT ename,
	to_char(hiredate, 'YYYY/MM/DD') "입사년월",
	to_char(hiredate, 'Q') "분기"
FROM emp
WHERE TO_CHAR(hiredate,'Q') = '2'; 


4. decode문의 기본형식을 기본예제와 함께 기술하세요.
	decode(데이터, case1,case1에해당할때처리, 그외 처리);
    SELECT ename, deptno,
        decode(deptno,10,'인사과',
                      20,'총무',
                      30,'회계',
                '부서정하지않음') 부서명
    FROM emp;


5. case문의 기본형식을 기본예제와 함께 기술하세요.

	1) 조건문 형태 활용
	case when 논리|산술|관계 then 처리할 데이터
		 when 논리|산술|관계 then 처리할 데이터
		 else 기타처리할 데이터
	end
    select ename, deptno,
        case when deptno = 10 then sal*0.2
             when deptno = 20 then sal*0.5
             when deptno = 30 then sal*0.7
             else sal*1.2
        end show
    from emp;


	2) switch case 문 형태
	case [컬럼명]
		when 데이터1 then 처리할 데이터
		when 데이터2 then 처리할 데이터
		else 그외 데이터
	end	
    SELECT ENAME, HIREDATE, 
        TO_CHAR(HIREDATE, 'Q') 분기, SAL,
        CASE TO_CHAR(HIREDATE, 'Q')
             WHEN '1' THEN SAL * 0.3
             WHEN '2' THEN SAL * 0.2
             WHEN '3' THEN SAL * 0.1
             else SAL * 0.05
        END 보너스
    FROM EMP;


6. nvl, nvl2, nullif 함수의 차이점을 기술하세요. ~9:30 정리하고 전달해주세요.
    nvl(데이터, null값일 때 처리할 데이터)
        SELECT ename, sal, comm, sal + comm,
                nvl(comm,0), sal+nvl(comm,0)
        FROM emp;
    nvl2(데이터, null이 아닐 때 처리할 데이터, null일때 처리할 데이터)
        SELECT ename, sal, comm, nvl2(comm, comm*1.1,100) "보너스"
        FROM emp;

    nullif(데이터1, 데이터2) : 
        두 개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고, 동일하지 않으면
        첫번째 데이터1을 반환처리하는 함수를 말한다.
        SELECT nullif('a','a') show1,
                nullif('a','b') show2,
                nvl(NULLIF('a','a'),'동일') show3,
                nvl(NULLIF('a','b'),'동일') show3 
        FROM dual;
