package javaexp.a06_inherit;

import java.awt.Robot;

public class A03_interface {
	/*
	 # 인터페이스 상속
	 1. 인터페이스는 상위에 기능 메서드와 추상메서드를 통해서 하위의
	 	여러가지 기능을 효과적으로 처리할 때, 사용된다.
	 2. 기본 형식
	 	interface 인터페이스명 {
	 		void call();
	 		// 인터페이스는 기본적으로 public abstract가 포함되어 있기 때문에 생략이 가능하다.
	 	}
	 	하위클래스 implements 인터페이스명1, 인터페이스명2 {
	 		// 상위에 선언된 추상메서드 반드시 하위에 선언을 하여야 한다.
	 		void call() {
	 			// 재정의 선언
	 		}
	 	}
	 	cf) 일반 상속은 extends는 단일 상위 클래스만 가능하지만,
	 		인터페이스는 여러 개의 상위 인터페이스를 상속 가능하다.
	 		
	 3. 기타 인터페이스의 필드와 속성
	 	1) 인터페이스의 필드는 static 상수만 사용한다.
	 	2) default 메서드가 있다.
	 	3) static 메서드를 선언할 수 있다.
	 	
	 */

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Flyway f1 = new CountryFlying();
//		f1.flying();
//		Flyway f2 = new worldFlying();
//		f2.flying();
//		
//		SoundWay s1 = new DuckSound();
//		SoundWay s2 = new BabySound();
////		SoundWay s3 = new RobotSound();
//		s1.sound();
//		s2.sound();
//		s3.sound();
		
//		Mz m1 = new Mz();
//		m1.flying();
//		인터페이스로 매개변수가 있으면, 상속받은 여러가지 하위클래스는
//		다형성에 의해서 할당할 수 있다.
//		public void setFly(Flyway fly) {
//		Flyway fly = new CountryFlying();
//		m1.setFly(new CountryFlying());
//		m1.flying();
//		m1.setFly(new worldFlying());
//		m1.flying();
//		m1.setFly(new SpaceFlying());
//		m1.flying();
//		
//		SoundBox sb = new SoundBox();
//		sb.setSoundWay(new BabySound());
//		sb.sound();
//		
//		m1.attack();
//		m1.setAttackWay(new LaserBeam());
//		m1.attack();
//		m1.setAttackWay(new RocketMissile());
//		m1.attack();
	}
	
interface Flyway {
	void flying();
}
class CountryFlying implements Flyway {
	@Override
	public void flying() {
		System.out.println("우리 동네를 날아다니다!!");
	}
}
class worldFlying implements Flyway {
	@Override
	public void flying() {
		System.out.println("전 세계를 날아다니다!!");
	}
}

// #### 인터페이스를 사용하면, 추가적이거나 변경된 기능을 메인 객체인
// Mz에 코드를 하지 않더라도 처리가 가능하여 보다 효과적인 프로그래밍이 가능하다.

//AttackWay 인터페이스 선언, attack(); 추상메서드 선언.
//상속받는 실제 클래스 LaserBeam, RocketMissile.
//Mz에 AttackWay 할당하는 부분과 attack()를 통해서 여러가지 공격방법에 따라 공격 처리.

interface AttackWay {
	void attack();
}
class LaserBeam implements AttackWay {
	@Override
	public void attack() {
		System.out.println("레이저 빔을 발사하다.");
	}
}
class RocketMissile implements AttackWay {
	@Override
	public void attack() {
		System.out.println("로켓미사일을 발사하다.");
	}
}

class Mz {
	private Flyway fly;
	private AttackWay attackway;
	
	public void setAttackWay(AttackWay attackway) {
		this.attackway = attackway;
	}
	public void attack() {
		System.out.println("## MZ가 공격을 합니다 ##");
		if(attackway != null) { // 할당 여부를 확인
			attackway.attack();
		} else {
			System.out.println("무기가 장착되지 않았습니다!!");
		}
	}
	
	public void setFly(Flyway fly) {
		this.fly = fly;
	}
	public void flying() {
		System.out.println("로봇이!!");
		if(fly!=null) {
			fly.flying();
		} else {
			System.out.println("날개가 장착되지 못 했습니다!!");
		}
	}
}

// ex) interface로 SoundWay로 선언하고, 메서드로 sound()로 추상메서드 선언
//	하위에 실제클래스로 DuckSound, BabySound, RobotSound를 상속받아
//	main()에서 호출하여 처리하세요.

interface SoundWay {
	void sound();
}
class DuckSound implements SoundWay {
	@Override
	public void sound() {
		System.out.println("꽥꽥!");
	}
}
class BabySound implements SoundWay {
	@Override
	public void sound() {
		System.out.println("응애 응애!");
	}
class RobotSound implements SoundWay {
		@Override
		public void sound() {
			System.out.println("삑삑! 전자음을 내다!");
		}
	}
}

// ex1) SpaceFlying : 우주를 날다!! 처리 Mz에 할당 및 수행

class SpaceFlying implements Flyway {
	@Override
	public void flying() {
		System.out.println("응애 응애!");
	}
}

//ex2) SoundBox 클래스에 위에 정의한 SoundWay를 필드로 선언하여
//setSound()와 showSound()메서드를 통해서 다양한 소리가 나오게 하세요.

class SoundBox {
	private SoundWay soundway;

//	SoundWay를 상속받은 하위 객체가 매개변수로 들어올 수 있게 처리.
	public void setSoundWay(SoundWay sw) {
		this.soundway = sw;
		}
	public void sound() {
		System.out.println("# 사운드 박스에 있는 소리 #");
		if(soundway!=null) {
			soundway.sound();
		} else {
			System.out.println("소리가 할당되지 않았습니다.");
			}
		}
	}
}