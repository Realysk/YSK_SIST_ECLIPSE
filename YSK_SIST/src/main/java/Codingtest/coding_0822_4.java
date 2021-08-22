package Codingtest;

import java.util.Scanner;

public class coding_0822_4 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);

		System.out.print("테스트 케이스 : ");

		for(int T = sc.nextInt(); T>=T; T++) {
			
			System.out.print("A : ");
			int A = sc.nextInt();
			
			System.out.print("B : ");
			int B = sc.nextInt();

			System.out.println(A + " + " + B + " = " + (A+B));
			
		}
		
	}

}