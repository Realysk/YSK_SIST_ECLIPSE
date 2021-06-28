package SungKeun.DHLOTTO.LT1_LOTTO645.test;
import java.util.Random;
import java.util.Scanner;
 
public class lotto1_test {
    public static void main(String[] args) {
 
        // 입출력함수 정의
        Scanner sc = new Scanner(System.in);
 
        // 배열크기 정의
        int LottoNumber[] = new int[6];
 
        // 랜덤함수 정의
        Random random = new Random();
 
        // 로또숫자 범의 (min, max 정의)
        int min = 1;
        int max = 45;
 
        while (true) {
 
            System.out.println("로또번호 프로그램입니다.");
            System.out.println("게임 횟수를 입력해주세요");
            System.out.println("EXIT를 누르시면 종료됩니다.");
            
            // 종료변수
 
            // 숫자만 입력할 수 있게 처리함
 
            while (!sc.hasNextInt()) {
                //sc.next();
                if(sc.next().equalsIgnoreCase("EXIT")) {
                    System.out.println("게임을 종료합니다");
                    System.exit(0);
                }else {
                    System.out.println("숫자 또는 종료 명령문을 입력해주세요");                    
                }
                
 
            }
 
            // 입력받을 게임 수 입력하기
            int count = sc.nextInt();
            try {
 
                // 입력받은 수 만큼 count 증가시키기
                for (int countstart = 1; countstart <= count; countstart++) {
                    // for문 돌려서 1 ~ 45번의 랜덤숫자 추출
                    for (int i = 0; i < LottoNumber.length; i++) {
                        // nextInt(45) 이면 해당 범위가 0 ~ 44 이므로
                        // 내가 실제 구하고 싶은건 1 ~ 45 이기 때문에 마지막에 츼소값인 min을 더해주면 된다!
                        LottoNumber[i] = (random.nextInt((max - min) + 1) + min);
                        // System.out.println("LottoNumber --> " + LottoNumber[i]);
 
                        // 중복처리로직
                        // 앞의 숫자와 뒤의 숫자가 같으면 중복된 숫자를 알려주고 다시 한 번돈다.
 
                        for (int j = 0; j < i; j++) {
                            if (LottoNumber[i] == LottoNumber[j]) {
                                // System.out.println("중복된 숫자가 있어요 --> " + LottoNumber[i]);
                                // 중복건수를 처리하기의해 반복분 i 번째를 다시 내린다.
                                i--;
                            }
 
                            // 오름차순 처리로직
                            // 해당 알고리즘은 정말많이 쓰인다. 현재는 작은 수부터 크게 나오게 코딩했지만
                            // 부등호를 반대로해주면 큰 수부터 차례대로 내열한다.
                            if (LottoNumber[i] < LottoNumber[j]) {
                                int LottoNumberTemp = LottoNumber[i];
                                LottoNumber[i] = LottoNumber[j];
                                LottoNumber[j] = LottoNumberTemp;
                            }
 
                        }
 
                    }
                    System.out.println("게임 횟 수 " + countstart);
 
                    // 위에서 정리된 LottoNumber 배열을 다시 마지막으로 정리
                    for (int i = 0; i < LottoNumber.length; i++) {
                        System.out.println("LOTTO NUMBER  ------->               " + LottoNumber[i]);
                    }
                    System.out.println("############################################");
 
                }
 
                System.out.println("발생한 로또 비용은 ? " + count * 1000 + "원 입니다.");
                System.out.println("지나친 로또 투자는 당첨확률을 높게합니다.");
                
                System.out.println("");
                // 게임 계속해서 반복하기
 
            } catch (Exception e) {
                System.out.println("알 수 없는 오류로 입니다 재시작해주세요");
            } finally {
                System.out.println("MADE BY LEE");
            }
 
 
        }
 
    }
 
}