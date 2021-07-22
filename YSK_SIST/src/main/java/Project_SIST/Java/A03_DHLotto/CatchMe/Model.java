package Project_SIST.Java.A03_DHLotto.CatchMe;

// 화면에 넘겨 줄 임시 모델 객체
public class Model {
	   public void addAttribute(String key, Object ob) {
	      System.out.println("# 모델 데이터 처리 (화면에 전달할 데이터) #");
	      System.out.println("key : " + key);
	      System.out.println("객체 : " + ob);
	   }
	}