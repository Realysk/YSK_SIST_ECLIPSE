package springweb.a04_aop.advice;

import org.aspectj.lang.ProceedingJoinPoint;
// springweb.a04_aop.advice.Profiler
// spring 공통 컨테이너에 적용할 advise 클래스 선언.
public class Profiler {
	
	public Object trace(ProceedingJoinPoint jointPoint) {
		Object obj= null; // 수행한 객체를 return
		// 1. 수행 정보 출력..
		String signatureStr = jointPoint.getSignature().toShortString();
		System.out.println(signatureStr+"시작!!");
		// 	1) 처리하는 수행의 부하를 파악하는 시작/마지막 시간을 check
		long start = System.currentTimeMillis();
		
		// 2. 실제 해당 객체 수행..
		try {
			obj = jointPoint.proceed();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("수행시 예외 발생:"+e.getMessage());
		}finally {
			long end = System.currentTimeMillis();
			System.out.println(signatureStr+"종료");
			System.out.println("수행 시간:"+(end-start)+"밀리 세컨드(milis)");
		}
		return obj;
	}
}
