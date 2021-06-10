package javaexp.a00_exp;

public class RCPgame2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		if ((int)(Math.random() * 3 + 0) == 0) {
			   System.out.println("가위");
		   } else if ((int)(Math.random() * 3 + 0) == 1) {
			   System.out.println("바위");
		   } else {
			   System.out.println("보");
		   }

	}

}
