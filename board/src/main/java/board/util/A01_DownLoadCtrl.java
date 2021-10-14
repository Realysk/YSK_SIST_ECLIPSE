package board.util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class A01_DownLoadCtrl {
	// http://localhost:7080/board/download.do
	@RequestMapping("download.do")
	public String download(@RequestParam("fname") String fname, Model d) {
		// viewer 안에 있는 모델명과 동일하게 하여 이름 설정
		d.addAttribute("downloadFile", fname);
		
		return "downloadViewer";
	}
}
