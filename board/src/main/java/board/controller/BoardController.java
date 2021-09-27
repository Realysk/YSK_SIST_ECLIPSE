package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.vo.Board;

@Controller
@RequestMapping("board.do")
public class BoardController {
	// http://localhost:7080/board/board.do?method=list
	@RequestMapping(params="method=list")
	public String boardList(Board sch, Model d) {
		
		d.addAttribute("list", "");
		return "a01_list";
	}
	
	/*
	 ex1) 조회화면
	 ex2) 검색 되는 조회화면
	 */
	
}