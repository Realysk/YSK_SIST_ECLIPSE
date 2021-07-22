package Project_SIST.Java.A02_Marpple.Join;

// 화면에 넘겨 줄 임시 모델 객체
public class Model {
	   public void addAttribute(String key, Object ob) {
		  System.out.println("===============================================\n");
	      System.out.println("# 모델 데이터 처리 (화면에 전달할 데이터) #\n");
	      System.out.println("key : " + key + "\n");
	      System.out.println("객체 : " + ob);
	   }
	}