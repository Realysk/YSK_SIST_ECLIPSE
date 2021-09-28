package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.service.BoardService;
import board.vo.Board;

@Controller
@RequestMapping("board.do")
public class BoardController {
	@Autowired(required=false)
	private BoardService service;
	/*
	 ex1) 조회화면
	 ex2) 검색 되는 조회화면
	 */
	// http://localhost:7080/board/board.do?method=list
	// 각 기능별 메서드를 params="기능요청선언"
	@RequestMapping(params="method=list")
	public String boardList(Board board, Model d) { // 모델어트리뷰트로 객체 이름으로 지원
		// service단에 요청값으로 전달해온 데이터를 board를 넣고 dao에 의해 받은 결과값을 list라는 모델명으로 사용
		d.addAttribute("list", service.boardList(board));
		return "a01_list";
	}

	// http://localhost:7080/board/board.do?method=insert
	@RequestMapping(params="method=insert")
	public String boardInsert(Board ins) {
		return "";
	}

	// http://localhost:7080/board/board.do?method=detail
	@RequestMapping(params="method=detail")
	public String boardDetail(Board ins) {
		return "";
	}
	
	// http://localhost:7080/board/board.do?method=update
	@RequestMapping(params="method=update")
	public String boardUpdate(Board upt) {
		return "";
	}
	
	// http://localhost:7080/board/board.do?method=delete
	@RequestMapping(params="method=delete")
	public String boardDelete(Board delNo) {
		return "";
	}
	
	// http://localhost:7080/board/board.do?method=replyFrm
	@RequestMapping(params="method=replyFrm")
	public String boardReply(Board bd) {
		return "";
	}
	
}