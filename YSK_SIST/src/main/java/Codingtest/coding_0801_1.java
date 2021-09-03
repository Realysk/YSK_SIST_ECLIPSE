package Codingtest;

public class coding_0801_1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
				
		int A = (int)(Math.random()*10+1);
		int B = (int)(Math.random()*10+1);
		
		if(A > B) {
			System.out.println(">");
		} else if (A < B) {
			System.out.println("<");
		} else {
			System.out.println("==");
		}
	}

}
