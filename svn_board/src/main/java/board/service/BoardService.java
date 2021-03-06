package board.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.BoardDao;
import board.vo.Board;
import board.vo.BoardFile;
import board.vo.BoardSch;

@Service
public class BoardService {
	// mybatis에서 만들어진 BoardDao를 상속받은 실제객체가 container에 메모리가 있으면
	// 할당처리..
	// 객체가 없더라도 에러가 발생하지 않게 처리..
	@Autowired(required = false)
	private BoardDao dao;
	public ArrayList<Board> boardList(BoardSch sch){
		if(sch.getSubject()==null) sch.setSubject("");
		if(sch.getWriter()==null) sch.setWriter("");
		sch.setCount(dao.totCnt(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		sch.setPageCount( (int)Math.ceil( 
				sch.getCount()/(double)sch.getPageSize() ));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		// 현재 페이지는 총 페이지수를 넘지 못한다. next에 대한 처리 방지.
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}		
		System.out.println("현재 페이지 번호:"+sch.getCurPage());
		System.out.println("총 페이지수:"+sch.getPageCount());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		// 블럭 처리.: [1][2][3][4][5]>>
		// 1. 블럭 크기 지정.
		sch.setBlockSize(5);
		// 2. blocknum 지정 : 현재페이지번호/블럭의 크기
		int blocknum = (int)(Math.ceil(sch.getCurPage()/(double)sch.getBlockSize()));
		// 3. 마지막 블럭번호..
		//    총페이지수가 23 ==> 한번에 보여줄 block의 수가 5   25로 나와 에러가 발생.
		//    마지막 블럭번호는 총페이지수를 넘지 못하게 처리..
		int endBlock = blocknum*sch.getBlockSize();
		
		if(endBlock>sch.getPageCount()) {
			endBlock =sch.getPageCount(); 
		}
		
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		
		
		return dao.boardList(sch);
	}
	public void insertBoard(Board ins) {
		System.out.println("#첨부파일#"+ins.getReport().getOriginalFilename());
		dao.insertBoard(ins);
		uploadFile(ins.getNo(), ins.getReport() );
	}	
	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;
	private void uploadFile(int no, MultipartFile report) {
		// 1. multipartfile 객체를 file객체로 변환.
		String fileName = report.getOriginalFilename();
		if(fileName!=null && !fileName.equals("")) {
			File tmpFile = new File(tmpUpload+fileName);
			File orgFile = new File(upload+fileName);
			try {
				// 변환
				report.transferTo(tmpFile);
				// 최종 웹 서버에 있는 파일 위치로 로딩.
				Files.copy(tmpFile.toPath(), orgFile.toPath(), 
						StandardCopyOption.REPLACE_EXISTING);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 2. DB처리하기
		dao.uploadFile(new BoardFile(fileName));
	}
	
	public Board getBoard(int no) {
		// 상세조회시, 조회카운트 up
		dao.uptReadCnt(no);
		Board b = dao.getBoard(no);
		b.setFname(dao.getBoadFile(no));
		return b;
	}	
	public void update(Board update) {
		dao.updateBoard(update);
	}	
	public void deleteBoard(int no) {
		dao.deleteBoard(no);
	}	
}
