package SungKeun.JSTUDY.JSQ_WEEKLYQUIZ;

import SungKeun.JSTUDY.Model;

public class JSQMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		JSQDTO jcoq1 = new JSQDTO();
		// Controller만 호출.
		JSQController jsqctrl = new JSQController();
		System.out.println("\n# 호출된 화면 #\n");
		System.out.println(jsqctrl.JSQList2(jcoq1, new Model()));

	}

}
