package board.dao;

import java.util.ArrayList;

import board.vo.Board;
import board.vo.BoardFile;

// board.dao.BoardDao
public interface BoardDao {
	public ArrayList<Board> boardList(Board sch);
	public void insertBoard (Board ins);
	public void uploadFile (BoardFile ins);
	public ArrayList<BoardFile> getBoardFile (int no);
	public Board getBoard (int no);
}