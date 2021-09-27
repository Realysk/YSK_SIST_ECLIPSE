package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board.do")
public class BoardController {
	// http://localhost:7080/board/board.do?method=list
	@RequestMapping(params="method=list")
	public String boardList(Model d) {
		
		return "a01_list";
	}
}
