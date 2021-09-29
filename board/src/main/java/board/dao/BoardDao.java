package board.dao;

import java.util.ArrayList;

import board.vo.Board;
import board.vo.BoardFile;

// board.dao.BoardDao
public interface BoardDao {
	public ArrayList<Board> boardList(Board sch);
	public void insertBoard(Board ins);
	public void updateBoard(Board upt);
	public void deleteBoard(int no);
	/*
	 	UPDATE board
			SET readcnt = readcnt+1
		WHERE NO = #{no}
	 */
	public void uptReadCnt(int no);
	
	public void uploadFile(BoardFile ins);
	public ArrayList<BoardFile> getBoadFile(int no);
	public Board getBoard(int no);

}
