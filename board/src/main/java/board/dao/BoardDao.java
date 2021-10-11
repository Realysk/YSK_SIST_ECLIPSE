package board.dao;

import java.util.ArrayList;

import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;

// board.dao.BoardDao
public interface BoardDao {
	public int totCnt(BoardSch sch); // 총 데이터 건수
	public ArrayList<Board> boardList(BoardSch sch);
	public void insertBoard(Board ins);
	public void updateBoard(Board upt);
	public void deleteBoard(int no);
	/*
UPDATE board
	SET readcnt = readcnt+1
WHERE NO = #{no}
	 * */
	public void uptReadCnt(int no);
	
	public void uploadFile(BoardFile ins);
	public String getBoadFile(int no);
	public Board getBoard(int no);

}
