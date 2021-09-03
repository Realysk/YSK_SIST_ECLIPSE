package Codingtest;

import java.util.Scanner;

public class coding_0822_3 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("단 입력 : ");
		int N = sc.nextInt();
			
		for(int M=1; M<=9; M++) {
			
			System.out.println(N + " * " + M + " = " + (N*M));
			
		}

	}

}
