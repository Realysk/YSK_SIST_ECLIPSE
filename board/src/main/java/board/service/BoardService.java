package board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.vo.Board;

@Service
public class BoardService {
	// mybatis에서 만들어진 BoardDao를 상속받은 실제객체가 Container에 메모리가 있으면 할당 처리
	// 객체가 없더라도 에러가 발생하지 않게 처리
	@Autowired(required = false)
	private BoardDao dao;
	public ArrayList<Board> boardList(Board sch) {
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getWriter()==null) sch.setWriter("");
		return dao.boardList(sch);
	}
	
}
