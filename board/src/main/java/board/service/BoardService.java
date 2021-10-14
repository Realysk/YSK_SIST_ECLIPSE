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
		
		// 1. 총 건수 설정
		sch.setCount(dao.totCnt(sch));
		
		// 2. 페이지 크기 (요청) : default로 페이지 크기 지정 - 초기 화면
		if(sch.getPageSize() == 0) {
			sch.setPageSize(5);
		}
		
		// 3. 총 페이지 수
		// ex) 데이터 건수 10 => 2
		//		데이터 건수 16 => 3 + 1 (4)
		// sch.getCount()/sch.getPageSize()
		// Math.ceil() : 올림 처리, 나머지 값이 있으면 바로 올림
		// java : 정수/정수 => 정수, 원하는대로 소숫점 처리가 되려면 double promote 형 변환 필요
		// Math.ceil()의 리턴값은 실수여서 정수로 casting
		// int totPage = (int)( Math.ceil( sch.getCount()/(double)sch.getPageSize() ) );
		sch.setPageCount( (int)( Math.ceil( sch.getCount()/(double)sch.getPageSize() ) ) );
		
		// 4. 화면에서 클릭한 페이지 번호 (요청값) : 초기화면을 위한 default 설정
		if(sch.getCurPage() == 0) {
			sch.setCurPage(1);
		}
		// 현재 페이지는 총 페이지 수를 넘지 못한다.
		if(sch.getCurPage() > sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		
		// 5. DB로 보낼 한 페이지에 보일 데이터 (시작번호/마지막번호 지정)
		// sch.getCurPage() : 클릭한 페이지 번호
		// sch.getPageSize() : 한번에 보여줄 데이터 건수
		// 1, 5 => 마지막 페이지의 번호 1*5 = 5
		// 2, 5 => 2*5 = 10
		// 3, 3 => 3*3 = 9
		/*	
		 	5건씩 보이는 페이지
		 	페이지번호		페이지건수		보일페이지
		 		1			5		1   2   3   4   5
		 		2			5		6   7   8   9   10
		 		3			5		11  12  13  14  15
		 		4			5		16  17  18  19  20
		 		
		 		시작 페이지
		 		(1-1)*5+1 - (현재페이지번호-1)*화면에보일페이지건수+1
		 		(2-1)*5+1
		 */
		sch.setStart((sch.getCurPage()-1) * sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		
		// 블럭 처리
		// 1. 블럭 크기 지정
		sch.setBlockSize(5);
		// 2. blocknum 지정 : 현재페이지번호/블럭의크기
		int blocknum = (int)( Math.ceil( sch.getCurPage()/(double)sch.getBlockSize() ) );
		// 3. 마지막 블럭번호
		// 총 페이지 수가 23 ==> 한번에 보여줄 block의 수가 5		25로 나와 에러가 발생
		// 마지막 블럭번호는 총 페이지 수를 넘지 못하게 처리
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock > sch.getPageCount()) {
			endBlock = sch.getPageCount();
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