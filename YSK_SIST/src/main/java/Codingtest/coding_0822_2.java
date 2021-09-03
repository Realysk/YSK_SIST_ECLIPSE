package Codingtest;

import java.util.Scanner;

public class coding_0822_2 {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);

		System.out.println();
		int H = sc.nextInt();
		
		System.out.println(H * 60);
		
		System.out.println();
		int M = sc.nextInt();
		
		System.out.println(M * 60);
		
		if(H >= 0 && H <= 23 && M >= 0 && M <= 59) {
		
			System.out.println((H + M));
			
		} else {
			
			System.out.println("입력 오류");
		
		}

	}

}
