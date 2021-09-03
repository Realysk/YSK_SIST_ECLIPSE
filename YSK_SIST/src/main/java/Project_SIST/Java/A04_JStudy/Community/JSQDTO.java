package Project_SIST.Java.A04_JStudy.Community;

public class JSQDTO {
	private String quest; // 문제
	private String answer; // 정답
	
	public JSQDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public JSQDTO(String quest, String answer) {
		super();
		this.quest = quest;
		this.answer = answer;
	}
	
	public String getQuest() {
		return quest;
	}

	public void setQuest(String quest) {
		this.quest = quest;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
    public String toString() {
        return " \n # 문제 : " + quest + "\n"
        		+ " # 정답 : " + answer + "\n" + "\n";
    }	
}