package onbiz.util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardDLCtrl {
	// http://localhost:7080/onbiz/download.do
	@RequestMapping("download.do")
	public String download(@RequestParam("bd_fname") String bd_fname, Model d) {
		// viewer 안에 있는 모델명과 동일하게 하여 이름 설정
		d.addAttribute("downloadFile", bd_fname);
		
		return "downloadViewer";
	}
}
