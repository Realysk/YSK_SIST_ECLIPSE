package Project_SIST.Java.Main;

import Project_SIST.Java.DAO.LOTTEDAO;

public class LotteMain {
    public static void main(String[] args) {
    	
    	// DAO 클래스 실행
        LOTTEDAO dao = new LOTTEDAO();
        dao.run();
    }
}