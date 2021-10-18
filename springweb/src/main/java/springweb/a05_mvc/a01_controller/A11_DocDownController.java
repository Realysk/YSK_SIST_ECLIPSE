package springweb.a05_mvc.a01_controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.PageRank;

@Controller
public class A11_DocDownController {

	
	
//	http://localhost:7080/springweb/docDownLoadForm.do
	@RequestMapping("docDownLoadForm.do")
	public String initForm() {
		return "WEB-INF\\views\\a05_mvc\\a40_downLoadDocu.jsp";
	}
    @GetMapping("excel.do")
    public void excelDownload(HttpServletResponse response) throws IOException {
        Workbook wb = new HSSFWorkbook();
//        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;

        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("번호");
        cell = row.createCell(1);
        cell.setCellValue("이름");
        cell = row.createCell(2);
        cell.setCellValue("제목");

        // Body
        for (int i=0; i<3; i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(i);
            cell = row.createCell(1);
            cell.setCellValue(i+"_name");
            cell = row.createCell(2);
            cell.setCellValue(i+"_title");
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=example.xls");
//        response.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());

    }	
	
	@RequestMapping("pdf.do")
	public String pageRankReport(Model model) {
		List<PageRank> pageRanks = Arrays.asList(
				new PageRank(1, "/board/humor/1011"),
				new PageRank(2, "/board/notice/12"),
				new PageRank(3, "/board/phone/190")
				);
		model.addAttribute("pageRankList", pageRanks);
		return "pdfViewer";
	}
}
