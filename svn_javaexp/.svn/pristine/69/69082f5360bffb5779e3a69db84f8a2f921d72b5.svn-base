/*
# 중첩함수
1. 가장 내부에 있는 함수 f1의 결과값을 다음 함수 f2에 인수로 적용하고,
	다시 f2의 결과값을 f3에 인수로 사용할 때 활용하는 함수형태를 말한다.
	f3(f2(f1(데이터,매개변수),매개변수),매개변수)
	- 특정한 데이터에서 여러가지 함수의 기능을 처리하고자 할 때, 활용된다.
**/
-- 현재데이터의 입사년도를 올해연도로 변경하여 출력할려고 한다.
-- 합쳐서 날짜 데이터로 변경처리.
SELECT ename, to_char(sysdate,'YYYY') "올해연도",
	to_char(hiredate,'MMDD') "사원의입사월일",
	to_char(sysdate,'YYYY')||to_char(hiredate,'MMDD') "올해입사년월",
	to_date(to_char(sysdate,'YYYY')||
		to_char(hiredate,'MMDD'),'YYYYMMDD') "날짜형데이터"
FROM emp;	
-- ex) 입사일의 분기를 추출하여 해당 보너스의 기준으로 설정할려고한다.
--	 1) 입사일, 분기, 급여  
--   2) 분기 1==> 10%, 2==>20%, 3==>30%, 4==>40%
--		TO_CHAR(hiredate,'Q')*10 :묵시적 형변환으로 일어나는 부분.	
--   3) 급여와 연산하여 보너스금액 출력.
--   to_char(@@@,'Q'), 숫자형데이터 to_number() 
--   4) 입사일, 분기, 급여, 보너스(%), 보너스, 최종금액 출력하세요
SELECT ename, hiredate, TO_CHAR(hiredate,'Q') "분기", sal,
	TO_NUMBER( TO_CHAR(hiredate,'Q'))*10 "보너스(%)",
	sal*TO_NUMBER( TO_CHAR(hiredate,'Q'))/10 "보너스",
	sal+sal*TO_NUMBER( TO_CHAR(hiredate,'Q'))/10 "최종금액"
FROM emp;
/*
# 일반함수
1. nvl(데이터, null값일 때 처리할 데이터)
	1) 해당 데이터가 null값일 때, 처리할 데이터를 설정함으로 null에 대한 연산 처리시
		필요하다.
 * 
 * */
-- 하나의 컬럼의 데이터가 null일 때, 합산값도 null이기때문에 0으로 처리한다.
SELECT ename, sal, comm, sal + comm,
		nvl(comm,0), sal+nvl(comm,0)
FROM emp;
/*
2. nvl2(데이터, null이 아닐 때 처리할 데이터, null일때 처리할 데이터) 
 * */
-- comm이 null일때는 100으로 null이 아닐때는 comm에서 10%더 추가해서 결과값을
--  처리
SELECT ename, sal, comm, nvl2(comm, comm*1.1,100) "보너스"
FROM emp;
-- ex1) comm일 null일때는 sal의 15%로 설정하고, null일 아닐 때는 comm에서 sal의 5%를 더하여 보너스금액을
--     설정하여   사원명 연봉 보너스  를 출력하세요.

SELECT ename 사원명, sal 연봉, comm, 
		nvl2(comm, comm+sal*0.05, sal*0.15) 보너스
FROM emp;
/*
3. nullif(데이터1, 데이터2)
두 개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고, 동일하지 않으면
첫번째 데이터1을 반환처리하는 함수를 말한다.	
 * */
SELECT nullif('a','a') show1,
		nullif('a','b') show2,
		nvl(NULLIF('a','a'),'동일') show3,
		nvl(NULLIF('a','b'),'동일') show3 
FROM dual;
/*
-- ex) 회사에서 일괄보너스 지급 금액이 60이라고 정하는데, 
		연봉의 5%(10단위로 절삭)와 같으면
--     60, 다르면 연봉의 5%로 처리하는 sql을 작성하세요.
      trunc, nvl2, nullif
 * */

SELECT ename, sal, trunc(sal*0.05, -1) "연봉의 5%",
	nullif(trunc(sal*0.05,-1),60) "같은지 여부(null)",
	trunc(nvl2(nullif(trunc(sal*0.05,-1),60),sal*0.05,60),-1)
		"보너스"
FROM emp; 
/*
# decode 함수
1. 프로그래밍 언어의 if문이나 case문으로 표현되는 내용을 하나의 함수로 
	처리할 수 있게 해준다.
2. 기본형식
	decode(데이터, case1,case1에해당할때처리, 그외 처리);
	decode(데이터, case1, case1일때처리할데이터, 
				 case2, case2일때처리할데이터,
				 case3, case3일때처리할데이터,
	       위내용에해당하지않을 때 처리할 데이터) 
 * */
SELECT ename, deptno,
	decode(deptno,10,'인사과',
				  20,'총무',
				  30,'회계',
			'부서정하지않음') 부서명
FROM emp;
-- ex) 사원번호를 기준으로 짝수이면 홍팀, 홀수이면 청팀으로 처리하여 출력하세요. 
SELECT ename, empno, mod(empno,2) div,
	decode(mod(empno,2),0,'홍팀','청팀') 팀 
FROM emp;
SELECT * FROM emp;
-- ex) 입사일의 분기(1/4)를 기준으로 출장으로 가기로 했다.
--      1: 부산,  2: 광주, 3:제주  그외는 출장없음 으로 처리하기로 했다.
--   사원명, 입사일, 분기, 출장지 를 출력하세요
SELECT ename, hiredate, to_char(hiredate,'Q') 분기,
	decode(to_char(hiredate,'Q'),
			'1','부산',
			'2','광주',
			'3','제주',
			'출장없음' ) 출장지
FROM emp;
SELECT * FROM emp;
/*
# 일반 함수 case
1. decode의 확장된 함수 형식을 표현식 또는 컬럼 값 '=' 비교를 통해
	조건의 일치하는 경우에만 다른 값으로 대치하지만, case 함수에서는 
	산술 연산, 관계 연산, 논리 연산과 같은 다양한 비교가 가능하다.
2. 기본 형식
	1) 조건문 형태 활용
	case when 논리|산술|관계 then 처리할 데이터
		 when 논리|산술|관계 then 처리할 데이터
		 else 기타처리할 데이터
	end
	## 주의 
	case when은 앞에서 선언 조건식을 제외한 조건을 
	처리한다.
	
	2) switch case 문 형태
	case [컬럼명]
		when 데이터1 then 처리할 데이터
		when 데이터2 then 처리할 데이터
		else 그외 데이터
	end	
 * */
-- 부서번호에 따라 처리하는 데이터를 다르게 할 때.
select ename, deptno,
	case when deptno = 10 then sal*0.2
	     when deptno = 20 then sal*0.5
	     when deptno = 30 then sal*0.7
	     else sal*1.2
	end show
from emp;
select ename, deptno,
	CASE deptno
		 when 10 then sal*0.2
	     when 20 then sal*0.5
	     when 30 then sal*0.7
	     else sal*1.2
	end show
from emp;
SELECT ENAME, HIREDATE, 
	TO_CHAR(HIREDATE, 'Q') 분기, SAL,
    CASE TO_CHAR(HIREDATE, 'Q')
    	 WHEN '1' THEN SAL * 0.3
	     WHEN '2' THEN SAL * 0.2
	     WHEN '3' THEN SAL * 0.1
	     else SAL * 0.05
    END 보너스
FROM EMP;
-- 비교연산자 sal>=5000, sal>=4000
-- ex) 급여별 등급 표시
--	   		5000~ (A등급)
--	4000 ~  5000미만 (B등급)
--	3000 ~  4000미만 (C등급)
--	2000 ~  3000미만 (D등급)
--	1000 ~  2000미만 (E등급)
--	0 ~  1000미만 (F등급)
--	그외 (범위는 0이상) case when 문활용
SELECT ename, sal,
CASE WHEN sal>=5000 THEN 'A등급'
   WHEN  sal>=4000  THEN 'B등급' 
   -- CASE WHEN 앞에 있는 조건을 제외시킨다.
   -- when sal>=4000 and sal <5000 를 포함하고 있다.   
   WHEN  sal>=3000 THEN 'C등급'
   WHEN  sal>=2000 THEN 'D등급'
   WHEN  sal>=1000 THEN 'E등급'
   WHEN  sal>=0 THEN 'F등급'
   ELSE '범위는 0이상'
   END 등급
FROM emp;

SELECT ename, hiredate, to_char(hiredate, 'MM') "월",
	CASE WHEN to_number(to_char(hiredate, 'MM'))<=6 THEN '상반기'
		 ELSE '하반기'
	END "상/하반기 구분"
FROM emp;
-- ex) sal  5000이상(상), 2000~5000미만(중),  2000미만(하)
--    이름, 연봉, 등급 case when 구문으로 처리해서 출력..
SELECT ename 이름, sal 연봉, 
   CASE WHEN sal>=5000 THEN '상'
       WHEN sal>=2000 THEN '중'
       ELSE '하'
   END 등급
FROM emp;

