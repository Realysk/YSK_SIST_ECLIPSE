package onbiz.controller;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Component
@ControllerAdvice("onbiz")
public class ErrorCtrl {

	@ExceptionHandler(Exception.class)
	public String errorPage(Model model,Exception ex) {
		//무슨 에러인지 확인하기 위해서 메세지 저장
		model.addAttribute("error",ex.getMessage());
		//error 디렉토리의 error.jsp 파일을 에러 페이지로 설정
		return "error/error404";
	}
}
