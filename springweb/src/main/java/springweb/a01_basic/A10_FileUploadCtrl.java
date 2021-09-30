package springweb.a01_basic;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class A10_FileUploadCtrl {
	
	// http://localhost:7080/springweb/upload.do
	@GetMapping("upload.do")
	public String uploadFrm() {
		return "WEB-INF\\views\\a01_basic\\a21_uploadExp.jsp";
	}
	
	@PostMapping("upload.do")
	public String upload(@RequestParam("report") MultipartFile report,
						 @RequestParam("name") String name, Model d) {
		// Service에 처리한 내용
		service(report, name);
		return "WEB-INF\\views\\a01_basic\\a21_uploadExp.jsp";
	}
	
	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;
	private void service(MultipartFile report, String name) {
		
		// 파일 업로드 처리
		// 1. 파일명
		String fname = report.getOriginalFilename();
		if(fname != null && !fname.equals("")) {
			// 2. 파일 객체 생성
			File tmpFile = new File(tmpUpload+fname);
			File orgFile = new File(upload+fname);
			
			// 3. MultipartFile을 File 객체로 전환
			try {
				report.transferTo(tmpFile);
				// 4. 임시경로 파일을 서버에 있는 경로로 복사
				Files.copy(tmpFile.toPath(), orgFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			
		}
	}

}