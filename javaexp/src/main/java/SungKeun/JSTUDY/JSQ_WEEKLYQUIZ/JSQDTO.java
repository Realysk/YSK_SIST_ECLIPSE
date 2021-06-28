package SungKeun.JSTUDY.JSQ_WEEKLYQUIZ;

public class JSQDTO {
	private int questNum; // 정답을 맞춘 문제 번호 (오답이면 0)
	private String quest; // 문제
	private String usrAns; // 유저 정답
	private String answer; // 문제 정답
	private int weekly; // 문제 초기화 주기
	
	public JSQDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JSQDTO(int questNum, String quest, String usrAns, String answer, int weekly) {
		super();
		this.questNum = questNum;
		this.quest = quest;
		this.usrAns = usrAns;
		this.answer = answer;
		this.weekly = weekly;
	}

	public int getQuestNum() {
		return questNum;
	}

	public void setQuestNum(int questNum) {
		this.questNum = questNum;
	}

	public String getQuest() {
		return quest;
	}

	public void setQuest(String quest) {
		this.quest = quest;
	}

	public String getUsrAns() {
		return usrAns;
	}

	public void setUsrAns(String usrAns) {
		this.usrAns = usrAns;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public int getWeekly() {
		return weekly;
	}

	public void setWeekly(int weekly) {
		this.weekly = weekly;
	}

	@Override
    public String toString() {
        return " \n # 문제 번호 : " + questNum + "\n" +
        		" # 문제 : " + quest + "\n" +
        		" # 유저 정답 : " + usrAns + "\n" +
        		" # 문제 정답 : " + answer + "\n" +
        		" # 문제 초기화 일시 : " + weekly + "\n" + "\n";
    }
	
}
