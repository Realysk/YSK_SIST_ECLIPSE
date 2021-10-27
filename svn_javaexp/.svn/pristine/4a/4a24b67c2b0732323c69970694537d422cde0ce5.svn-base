/*
# database에서 함수(function)
1. sql에서 함수(주로 내장함수)
	1) 컬럼의 값이나 데이터 타입이 변경하는 경우
	2) 숫자 또는 날짜 데이터의 출력 형식이 변경하는 경우
	3) 하나 이상의 행에 대한 집계(aggregation)를 하는 경우
2. sql 함수의 유형
	1) 단일 행 함수 : 테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를
		적용하여 하나의 결과를 반환하는 함수 ex) 소문자로 변환 처리
	2) 복수 행 함수 : 조건에 따라 여러 행을 그룹화하여 그룹별로 결과를 하나씩
		반환하는 함수 
		여러 행의 데이터를 함수를 적용했을 때, 단일 또는 줄어든
		결과값을 리턴하여 처리할 때, 사용된다.
		ex) 부서별로 최소값 처리
3. 단일행 함수
	1) 데이터 값을 조작하는데 주로 사용한다.
	2) 행별로 함수를 적용하여 하나의 결과를 반환하는 함수이다.
	3) 단일행 함수의 종류
		문자함수(upper, lower, initcap), 
		숫자함수(ceil, trunc, round), 
		날짜함수(add_months), 
		변환함수(묵시적데이터변환/명시적데이터변환- 
		  문자==>숫자, 숫자==>날짜, 날짜 ==> 문자), 
		일반함수 nvl, decode
4. 단일행 함수의 사용법
	select 함수명(컬럼명/데이터, 매개변수1, 매개변수2...) 					
	where 컬럼 = 함수명(컬럼명/데이터, 매개변수1, 매개변수2...),
		함수(컬럼) = 함수(데이터);
	
# 문자함수
1. 문자 데이터를 입력하여 문자나 숫자를 결과로 반환하는 함수
2. 문자 함수의 종류
	1) 대소문자 변환 함수
	2) 문자조작 함수
	3) 문자열 길이 반환 함수.
3. initcap : 문자열의 첫 번째 문자만 대문자로 변환 처리 함수.	
   lower : 문자열 전체를 소문자로 변환
   upper : 문자열 전체를 대문자로 변환
   	  			  				  			  				  			  				  			  				  			  				  			  			
 * */
	SELECT * FROM emp;
	SELECT ename, INITCAP(ename), LOWER(ename), UPPER(ename)
	FROM emp;

-- ex) 함수를 이용하여 다음과 같은 형태로 출력하세요.(ename과 job) ||
--		 The job of Smith is a Clerk!
SELECT 'The job of '||initcap(ename) ||' is a 
	'||initcap(job)||'!' show
FROM emp;
-- 복사테이블 만들기
CREATE TABLE emp01
AS SELECT * FROM emp;

-- ctrl 키는 누를 상태에서 테이블명을 클릭..
SELECT * 
FROM emp01
ORDER BY empno desc;
-- 입력되어 있는 데이터를 대소문자 상관없이 검색을 처리할 때..
--  'a' 문자로 대소문자 상관없이 사원명 데이터를 검색 처리
SELECT ename, job
FROM emp01
WHERE UPPER(ename) LIKE '%'||upper('o')||'%';

CREATE TABLE emp02
AS SELECT * FROM emp;

SELECT * FROM emp02;
-- ex) emp01 테이블에 job 컬럼을 'Man'이라는 문자열로
--  대소문자 관계없이 키워드 검색을 할려고 한다. sql 작성하세요.
SELECT ename, job
FROM emp01
WHERE upper(job) LIKE '%'|| upper('Man') ||'%';
/*
# 문자열 길이 반환
1. length(데이터/컬럼명) : 입력되는 문자열의 길이(글자수)를 반환하는 함수.
2. lengthb(데이터/컬럼명) : 입력되는 문자열의 바이트를 반환하는 함수
	한글이나 특수문자는 1글자가 3bytes인 경우가 있어,
	영문과 한글은 글자 수에 따라 차이가 있다.
cf) dual : 오라클에서 지원되는 가상테이블로 테스트 용으로 한라인에 데이터와
	함수의 적용결과를 확인할 수 있다.	
 * 
 * */
SELECT length('hello') str1, lengthb('hello') str2,
	   length('안녕하세요') str3, lengthb('안녕하세요') str4
FROM dual; 
--ex) emp테이블의 사원명과 직책의 글자 수를 각각 표현하되,
--     job의 글자수가 6이상인 경우만 검색하여 출력하세요. [2조]
SELECT ename, length(ename), job, length(job)
FROM emp
WHERE length(job)>=6;
/*
# 기타 문자열 조작함수
1. concat(문자열1, 문자열2) : 두 문자열을 결합처리 한다. 
	문자열1 || 문자열2  동일..
	 concat(concat(문자열1, 문자열2),'문자열3') 
	 	 문자열1 || 문자열2 ||문자열3
	ex) concat('sql','plus') ==> sqlplus
2. substr(문자열데이터, 시작위치, 시작위치에서 갯수) :  
	문자열 데이터를 시작위치와 마지막위치를 기준으로 절삭처리하여 
	사용하는 것을 말한다.
	index : 0부터시작하는 경우/1부터 시작하는 경우
	ex) substr('sql*plus',5,4) ==> plus	 
	       sql*plus
	       12345     p부터 추출
	           plus
	           1234  4개 추출
			5번째 부터 시작해서 4개의 문자를 추출하여 데이터를 표현한다.
	ex) 코드성 데이터 - 사번, 주민번호, 학번에는 각각의 위치별로 의미하는 
		바가 있기 때문에 추출하여
		데이터 활용한다. 주민번호의 경우 생년월일을 위치에 따라 추출할 수 있다.		
 * */
	SELECT empno, ename, job, concat(ename, job) "이름과 직책"
	FROM emp;
-- ex1) || 쓰지말고 concat를 이중으로 활용하여, 사원명-사번 을 형식으로 표기하세요
	SELECT ename, empno, 
			--concat(ename,' - ') show1,
			--concat('사원명 - ', empno) show2,
			concat( concat(ename,' - '), empno) show3
	FROM emp;

-- ex2) 사원번호, 사원명, 입사일을 출력하되 ||, 
--       substr을 활용하여 입사일을  @@@@년 @@월 @@일로 출력하세요
--		''||hiredate를 통해서 문자열 형태로 출력되는 것을 확인
--      YYYY 형식에 맞게  '19'를 ||를 통해서 연결해준다.
--      그 중에서 연도만 추출하여 substr(데이터, 0, 4)
--      해당 데이터를 0 index부터시작여 4개만 추출 처리.(substr)
--		substr('19'||hiredate,0,4)
--			''||hiredate sh0,
--			'19'||hiredate sh1,
--			substr('19'||hiredate,0,4) sh2,
-- 
-- 날짜형 데이터는 자동 형변환으로 문자열로 비교연산자를
-- 활용할 때는 문자열로 변환하여 확인 후, 처리한다.
SELECT hiredate, ''||hiredate
FROM emp
WHERE substr(hiredate,1,2)='80';

	SELECT empno, ename, hiredate,
			substr('19'||hiredate,0,4)||'년'||
			substr(hiredate,4,2)||'월'||
			substr(hiredate,7,2)||'일'
			sh3
	FROM emp;








