--1. sal+comm으로 연산하는 경우 comm null인 경우, 
--   문제가 발생한다. 어떤 문제이고 이것을 해결할려면 어떤 처리를 하는지 정리하세요.
/*
/*	데이터베이스에서 null인 데이터는 연산을 처리시, 연산 결과가 null로 처리 된다.
      null인 경우 숫자값을
 * 	default인 0으로 설정해주는 함수로 지정하는 경우와 조건절에서 null을 배제하는 경우가 있다. 
 *  nvl(컬럼명, null일경우 처리할 데이터)
 *  위 경우  
 *  1) select sal + nvl(comm,0) 총계
 *  2) select sal + comm
 * 	   from emp
 *     where comm is null;
 * */

--2. 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
/*
	데이터베이스에서 각 컬럼에 대한 데이터 타입을 설정하여, 
	적절한 데이터의 크기와 유형과 사용형태에 
	맞게 설정해 준다.
	create table 테이블명( 컬럼명1  데이터타입, 컬럼명2 데이터타입,.... );
	1) varchar2(최고크기) : 사용하는 최고크기를 설정하고, 입력되는 데이터에 따라 가변적으로 데이터크기가
		설정되는 것을 말한다. 최대 4000바이트.. - 메모리효율화를 이룰 수 있다.
	2) number, number(p,s) : 정수/실수 등 숫자형 데이터를 설정할 때, 활용된다. 정밀도(p)와 스케일(s)
		로 표현된다. 전체크기, 소숫점 이하 크기로 쉽게 표현한다.
	3) date : 날짜/시간 형식을 저장하기 위한 데이터 타입..
		SYSDATE : 현재 오라클 시스템의 날짜를 	저장하거나 불러올 때, 사용된다.
*/
		SELECT ENAME, SYSDATE, HIREDATE
		FROM EMP;
/*
	4) char(고정크기) : 고정길이 문자 데이터타입, 최대 2000바이트
		코드성 데이터 즉, 학번,사번, 주민번호 등과 같이 길이가 일정하여 변경될 일이 없는 경우 사용된다.
		가변형에 비해 입력 속도가 빠르다.
	----------------------------------------------------------------	
	5) nvarchar2(최고크기) : 국가별 문자 집합에 따른 최고 크기의 문자를 설정하는 가변형 데이터 처리.
	6) rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 타입. 행당 6바이트 또는 10바이트
	7) blob : 대용량의 바이너리 데이터를 저장하기 위한 테이터타입 최대, 4gb
	8) clob : 대용량의 문자열 데이터를 저장하기 위한 데이터타입 최대, 4gb
	9) bfile : 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입, 4gb
	1) timestamp(n) :날짜형 데이터타입의 확장된 형태  n은millisecond. 자리수는 최대 9자리까지 표현 가능.
	 
 * */

--3. 문자열을 저장하는 데이터 중, 고정형과 가변형이 있다. 두 데이터 유형의 차이점을 기술하세요.
/*	고정형 char은 데이터를 입력시, 크기가 작은 문자열을 입력하더라도 공백으로 해당 크기만큼 저장 된다.
 * 	   동일한 데이터크기를 입력하는 코드성 데이터에 주로 사용된다.
 	가변형 varchar2는 최대 크기 이하 데이터를 입력시, 해당 크기만큼 데이터가 저장된다. 
 		일반적인 문자열을 저장할 때, 사용된다.
 * */
--4. 데이터 유형을 확인하고, 학생테이블(번호, 이름, 국어, 영어, 수학)을 만들고 
--  데이터를 입력하세요.
	CREATE TABLE student(
		NO NUMBER,
		name varchar2(30),
		kor NUMBER,
		eng NUMBER,
		math number
	);	
	INSERT INTO student values(1, '홍길동',80,90,80);
	INSERT INTO student values(2, '김길동',90,90,90);
	INSERT INTO student values(3, '신길동',95,90,85);	
--	테이블의별치.*  : (전체 컬럼)에서 추가할 때는 테이블 테이블의별칭으로   설정
--  컬럼을 통한 연산이나 함수를 통해서 처리될 수 있는 데이터는 테이블로 관리하지 않는다.
--  round(컬럼, 소숫점자리수) : 해당 자리수만큼 반올림 처리.
	SELECT a.*, kor+eng+math 총계, round((kor+eng+math)/3, 1) 평균 
    FROM student a;	
--5. 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
   	CREATE TABLE sportstar(
		name varchar(30),
		team varchar(50),
		records NUMBER 
		-- 컬럼명을 입력하다가 대문자로 변경이 되는 경우 내장된 keyword이기때문에 변경요망
	);
	INSERT INTO sportstar values('류현진','토론토 블루제이스',2.69);
	SELECT * FROM sportstar;
--6. select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?
/*
	select 선택컬럼1, 선택컬럼2
	from 테이블
	where 조건컬럼1 = 데이터,
	and 조건컬럼2 = 데이터	
   선택컬럼 : 출력할 컬럼에 대한 선택을 처리한다.(열단위 선택)
   조건컬럼 : 출력할 row단위 filtering 처리  (행단위 filtering 처리)
   # 2차원의 데이터를 SELECT, WHERE에 의해서 행/열단위로 선택 및 FILTERING을 해준다.
 * */

--7. where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
/*	WHERE 컬럼명1 = 데이터
 * 	AND 컬럼명2 = 데이터
	비교 연산자 : = , !=,<>, <, <=, >, >=(연산자)
	논리 연산자 : and, or, not
	기타 함수나 키워드  : between and , is null, in ...
 **/

--8. between, in 구문의 기본형식을 선언하고, 기본 예제를 기술하세요.
/*
 	컬럼명 between A and B  : A와 B사이
 	컬럼명 in (데이터1, 데이터2...), 컬럼명 in ( subquery )
 * */
	SELECT * FROM emp WHERE sal BETWEEN 1000 AND 3000;
	SELECT * FROM emp WHERE deptno IN (10,30);

--9. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 
-- 	이름을 알파벳 순으로 정렬되도록 질의문을 만드세요.
SELECT ename, deptno
FROM emp
WHERE deptno IN (10,30)
ORDER BY ename; 
-- 문자열 정렬은 default 알파벳 오름 차순으로 출력이 된다.  order by ename asc
-- asc (오름차순)은 생략이 가능하다.

--10. 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요(like %활용).
--  hiredate는 date타입이기에 보이는 모양과 문자열로 접근해서 보이는 모양은 차이가 난다.
--  ''||날짜형   강제 타입캐스팅    HIREDATE LIKE '%82%'; 문자열 타입케스팅된 내용을 비교
--  원칙적으로는 날짜형 ==> 함수에 의해 ==> 문자열로 변환   변환된 문자열을 비교 연산자로 비교..
SELECT ename, hiredate 입사일, ''||hiredate "입사일(문자)" 
FROM emp
WHERE HIREDATE LIKE '%82%';


--11. 보너스가 급여의 20%이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요. 급여(sal), 보너스(comm)
 SELECT ename, sal, comm
 FROM EMP e 
 WHERE comm >= sal*0.2
 AND deptno = 30;

--12. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
/*	 컬럼명 like '%검색할 키워드%'
 * 1.  앞뒤에서 시작하는 문자열 검색  : 
 * 			컬럼명  like '시작문자열%' 
 * 			컬럼명  like '%마지막문자열'
 * 2.  정확한 자리수에 문자/문자열  _(언더바)를 활용.
 * 			ex) 두번째에  A가 포함하는 문자열 검색 : 컬럼명 like '_문자열%'
 *    %는 중간에 문자의 갯수 제한 없고, _해당 문자의 갯수를 체크
 * */


--13. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)
	SELECT ename, hiredate
	FROM emp;
	SELECT max(hiredate) FROM emp; -- 최근 입사일 검색..
	SELECT ename, hiredate
	FROM emp
	WHERE hiredate in( SELECT max(hiredate) FROM emp );	
	
	


