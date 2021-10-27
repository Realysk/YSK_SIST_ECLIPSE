package javaexp.a00_exp.a05;

import java.util.ArrayList;
import javaexp.z01_vo.Student;
public class A11_0518 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
/*
1. while문과 do while문을 형식을 기술하고, 
    while문을 통해서, 아래와 같이 입력한 범위의 숫자의 합을
    아래 형식으로 출력하세요 
    마지막 숫자:5 (입력형식)
    1 + 2 + 3 +  4 +  5 = 15 (출력형식)
    while(반복조건){
    	반복수행할 내용
    }
    do{
    	일단 1번은 수행하고, 반복조건을 확인하여,
    	반복을 수행할 내용.
    }while(반복조건);
*/
//	Scanner sc1 = new Scanner(System.in);
//	System.out.print("1부터 누적 총합 연산할 마지막 숫자:");
//	int lastNum = sc1.nextInt();
//	int tot=0;
//	int cnt=1;
//	// lastNum = 3
//	// 1 + 2 + 3 = 6
//	while(cnt<=lastNum) {
//		System.out.print(cnt);
//		tot+=cnt;
//		if(cnt==lastNum) {
//			System.out.println(" = "+tot);
//		}else {
//			System.out.print(" + ");
//		}
//		cnt++;
//	}
	
		
		
/*    
 2. while문을 이용해서 아래와 같이
    번호를 선택해서 해당 번호의 (물건명과 가격) 갯수
    를 입력해서, 총 비용을 출력하세요
    = 메뉴 =
    1. 사이다  800
    2. 콜라   1200
    3. 캔커피  900
    완료하시겠습니까? Y
    1단계) 구매한 물건만 표시 (조건문)
    2단계) 총비용 표시	(배열)
    3단계) 구매한 물건/갯수/단가/단위계 ArrayList<Product>활용 (ArrayList활용)
            총계 : @@  표시..
*/
/*		
	Scanner sc2 = new Scanner(System.in);	
	String buyList="";
	while(true) {
		System.out.println("= 메뉴 =");
		System.out.println("1. 사이다  800");
		System.out.println("2. 콜라   1200");
		System.out.println("3. 캔커피  900");
		System.out.print("번호를 선택하세요:");
		int chNum = Integer.parseInt(sc2.nextLine());
		System.out.print("선택한 메뉴는 ");
		if(chNum == 1) {
			buyList+="사이다 ";
			// 비용과 총비용을 처리시, totPay와 price 변수를 추가하여
			// price= 800
			// totPay +=price;
			System.out.println("사이다");
		}else if(chNum == 2){
			buyList+="콜라 ";
			System.out.println("콜라");
		}else if(chNum == 3){
			buyList+="캔커피 ";
			System.out.println("캔커피");
		}else {
			System.out.println("선택의 범위는 1~3 번호를 다시 선택해주세요.");
			continue;
		}
		System.out.print("완료하시겠습니까?(Y/N):");
		if(sc2.nextLine().equals("Y")) {
			System.out.println("구매 완료!!");
			break;
		}
	}
	System.out.println("# 구매 리스트 내용#");
	System.out.println(buyList);
*/
/*
		Scanner sc3 = new Scanner(System.in);	
		String []bevs = {"사이다","콜라","캔커피"};
		int []prices = {800,1200,900};
		String buyList="";
		int totPay=0;
		while(true) {
			System.out.println("= 메뉴 =");
			System.out.println("1. 사이다  800");
			System.out.println("2. 콜라   1200");
			System.out.println("3. 캔커피  900");
			System.out.print("번호를 선택하세요:");
			int chNum = Integer.parseInt(sc3.nextLine());
			System.out.print("선택한 메뉴는 ");
			if(chNum>=1 && chNum<=3) {
				// 사이다(800)
				// index번호와 선택한 번호의 차이 -1
				System.out.println(bevs[chNum-1]+"("
						+prices[chNum-1]+")");
				buyList+=bevs[chNum-1]+"("
						+prices[chNum-1]+") ";
				totPay+=prices[chNum-1];				
			}else {
				System.out.println("선택의 범위는 1~3 번호를 다시 선택해주세요.");
				continue;				
			}
			System.out.print("완료하시겠습니까?(Y/N):");
			if(sc3.nextLine().equals("Y")) {
				System.out.println("구매 완료!!");
				break;
			}
		}
		System.out.println("# 구매 리스트 내용#");
		System.out.println(buyList);	
		System.out.println("총비용:"+totPay);
*/	
/*
		Scanner sc4 = new Scanner(System.in);	
		ArrayList<Product> menus = new ArrayList<Product>();
		menus.add(new Product("사이다",800,0));
		menus.add(new Product("콜라",1200,0));
		menus.add(new Product("캔커피",900,0));		
		ArrayList<Product> buyList = new ArrayList<Product>();
		//   구매리스트 []
		while(true) {
			System.out.println("= 메뉴 =");
			for(int idx=0;idx<menus.size();idx++) {
				// 메뉴리스트 [ (사이다),(콜라),(캔커피)]
				
				Product menu = menus.get(idx);
				System.out.print(idx+1+"\t");
				System.out.print(menu.getName()+"\t");
				System.out.print(menu.getPrice()+"\n");
			}
			System.out.print("번호를 선택하세요:");
			int chNum = Integer.parseInt(sc4.nextLine());
			System.out.print("선택한 메뉴는 ");
			// 선택메뉴의 범위는 1부터 menus list의 크기까지..
			if(chNum>=1 && chNum<=menus.size()) {
				System.out.print("구매할 갯수를 입력하세요:");
				int chCnt = Integer.parseInt(sc4.nextLine());
				// 이 중에서 입력한 번호에 해당하는 메뉴를 객체로 선택 
				// 입력한 번호에 해당하는 번호를 index로 가져온다.
				//  메뉴리스트 [ (사이다),(콜라),(캔커피)]
				//    선택된 (콜라)객체에 갯수를 할당.
				//    			(콜라, 1200, 3)
				//   구매리스트 [(콜라,1200,3),(캔커피,...),()]
				Product chProd = menus.get(chNum-1);
				chProd.setCnt(chCnt);
				System.out.println("# 선택 메뉴 정보 #");
				chProd.totShow();
				// 구매한 ArrayList에 할당.
				buyList.add(chProd);
			}else {
				System.out.println("선택의 범위는 1~"+menus.size()+"번호를 다시 선택해주세요.");
				continue;				
			}
			System.out.print("완료하시겠습니까?(Y/N):");
			if(sc4.nextLine().equals("Y")) {
				System.out.println("구매 완료!!");
				break;
			}
		}
		System.out.println("# 구매 리스트 내용 #");
		int totPay=0;
		// for(단위 객체 : 객체형 배열)
		for(Product prod:buyList) {
			// 기능메서드를 통해서 출력함께 단위계를 리턴하기 때문에
			// 전체 총계를 누적할 수 있다.
			totPay+=prod.totShow();
		}	
		System.out.println("총비용:"+totPay);
*/				
/*              
 3. do while문으로 다음 예제를 진행하세요.
    어서오세요! 
    갈비탕(12000) 전문집입니다!
    @@ 회 방문입니다.
    맛나게 먹고갑니다.
    또, 방문하시겠습니까?(Y/N)
    총방문횟수 : @@,  총 지불비용 : @@@
    */
	/*
	Scanner sc4 = new Scanner(System.in);
	int visitNum=0;
	int totPay = 0;
	do {
		visitNum++;
		totPay+=12000; // 방문시마다 총비용이 누적 처리..
		System.out.println("어서오세요!");
		System.out.println("갈비탕(12000) 전문집입니다!");
		System.out.println(visitNum+"회 방문입니다.");
		System.out.println("맛나게 먹고 갑니다.");
		System.out.print("또, 방문하시겠습니까(Y/N)?");
	}while( sc4.nextLine().equals("Y") );
	System.out.println("총방문횟수 : "+visitNum+
			"회,  총 지불비용 : "+totPay);
	*/		
/*  
4. while/do while을 이용하여, 
    컴퓨터와 함께 하는 임의의 숫자 맞추기 게임
    랜덤에 의해서 임의의 숫자(1~100)를 설정하면,
    맞출때까지, 반복문을 수행하는데, 
    hint로 보다 크다/보다 작다를 입력시 마다 
    나오게 처리하세요.
    */
	// 횟수
	/*
	Scanner sc5 = new Scanner(System.in);
	int corNum = 0;
	int ranNum = (int)(Math.random()*100+1);
	System.out.println("# 컴퓨터와 함께하는 숫자 맞추기 게임 #");
	while(true) {
		corNum++;
		System.out.print("번호가 무엇일까요?(1~100):");
		int inNum = sc5.nextInt();
		System.out.println("입력한 번호는 "+inNum);
		if(inNum==ranNum) {
			System.out.println("정답입니다!!");
			System.out.println(corNum+"째 성공!!");
			break;
		}else if(inNum>ranNum) {
			System.out.println("입력된 숫자가 컴퓨터 숫자보다 큰 수입니다");
		}else {
			System.out.println("입력된 숫자가 컴퓨터 숫자보다 작은 수입니다");
		}
	}
	*/
	
		
/*  
5. continue문을 이용하여, 1~12월 근무를 하되
    3달마다 "SM 유지보수하다"
    그외는 "SI 프로그래밍개발을 하다!"
    로 처리하세요.
    */
		for(int month=1;month<=12;month++) {
			System.out.print(month+"월 ");
			if(month%3==0) {
				System.out.println("SM 유지보수하다");
				continue;
			}
			System.out.println("SI 프로그래밍개발을 하다!");
		}
/*  
6. Student 클래스에 번호, 국어,영어,수학 속성을 할당하고,
    학생 5명을 ArrayList<Student>에 담아서 출력하세요
 */
		ArrayList<Student> stList = new ArrayList<Student>();
		System.out.println("번호\t국어\t영어\t수학\t총점\t평균");
		for(int idx=0;idx<5;idx++) {
			int kor= (int)(Math.random()*101);
			int eng= (int)(Math.random()*101);
			int math= (int)(Math.random()*101);
			stList.add( new Student(idx+1,kor,eng,math) );
			stList.get(idx).show();
		}
	}

}
