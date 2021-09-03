package Codingtest;

import java.util.Scanner;

public class coding_0801_2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("시험 점수 입력 : ");
		int score = sc.nextInt();
		
		if(score >= 90 && score <= 100) {
			System.out.println("A");
		} else if(score >= 80 && score <= 89) {
			System.out.println("B");
		} else if(score >= 70 && score <= 79) {
			System.out.println("C");
		} else if(score >= 60 && score <= 69) {
			System.out.println("D");
		} else if(score <= 59) {
			System.out.println("F");
		} else if(score > 100 || score < 0) {
			System.out.println("범위 초과");
		} else {
			System.out.println("점수를 입력하세요.");
		}
	}

}
